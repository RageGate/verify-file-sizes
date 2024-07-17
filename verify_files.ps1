# Path to the game folder (the script should be placed in the game folder)
$GameFolder = Get-Location
# Path to the file containing the list of files and their expected sizes and checksums
$SizeFile = Join-Path $GameFolder "file_sizes.txt"

# Function to get the size of a file
function Get-FileSize {
    param (
        [string]$FilePath
    )
    if (Test-Path $FilePath) {
        (Get-Item $FilePath).length
    } else {
        return $null
    }
}

# Function to compute MD5 checksum
function Get-FileMD5 {
    param (
        [string]$FilePath
    )
    if (Test-Path $FilePath) {
        $md5 = [System.Security.Cryptography.MD5]::Create()
        $stream = [System.IO.File]::OpenRead($FilePath)
        [System.BitConverter]::ToString($md5.ComputeHash($stream)).Replace("-", "").ToLower()
    } else {
        return $null
    }
}

# Prompt the user to choose the verification method
$verificationMethod = Read-Host "Choose verification method: 1 for File Size only (fast), 2 for File Size and MD5 (more accurate but slower)"

# Validate the user input
if ($verificationMethod -ne 1 -and $verificationMethod -ne 2) {
    Write-Output "Invalid selection. Please run the script again and choose 1 or 2."
    exit
}

# Array to hold files with incorrect sizes or checksums
$IncorrectFiles = @()

# Read the size file lines into an array
$sizeFileLines = Get-Content $SizeFile

# Initialize progress tracking
$totalFiles = $sizeFileLines.Count
$currentFileIndex = 0

# Process each line in the size file
foreach ($line in $sizeFileLines) {
    $currentFileIndex++
    $progressPercent = [math]::Round(($currentFileIndex / $totalFiles) * 100)
    Write-Host "Processing file $currentFileIndex of $totalFiles ($progressPercent%)..."

    # Extract file path, expected size, and expected MD5 checksum from the line
    $parts = $line -split ' '
    $FilePath = $parts[0]
    $ExpectedSize = [System.Int64]$parts[1]
    $ExpectedMD5 = $parts[2]

    # Get the full path of the file
    $FullFilePath = Join-Path $GameFolder $FilePath

    # Get the actual size of the file
    $ActualSize = Get-FileSize -FilePath $FullFilePath

    # Check if file exists
    if ($ActualSize -eq $null) {
        Write-Output "File missing: $FullFilePath"
        $IncorrectFiles += $FullFilePath
    }
    elseif ($verificationMethod -eq 1) {
        # Only check file size
        if ($ActualSize -ne $ExpectedSize) {
            Write-Output "File size mismatch for $FullFilePath (expected: size=$ExpectedSize, actual: size=$ActualSize)"
            $IncorrectFiles += $FullFilePath
        }
    }
    elseif ($verificationMethod -eq 2) {
        # Check both file size and MD5 checksum
        $ActualMD5 = Get-FileMD5 -FilePath $FullFilePath
        if ($ActualSize -ne $ExpectedSize -or $ActualMD5 -ne $ExpectedMD5) {
            Write-Output "File mismatch for $FullFilePath (expected: size=$ExpectedSize, md5=$ExpectedMD5; actual: size=$ActualSize, md5=$ActualMD5)"
            $IncorrectFiles += $FullFilePath
        }
    }
}

# Display the list of files with incorrect sizes or checksums
if ($IncorrectFiles.Count -ne 0) {
    Write-Output "The following files have incorrect sizes, checksums, or are missing:"
    $IncorrectFiles | ForEach-Object { Write-Output $_ }

    # Prompt the user to confirm deletion
    $confirm = Read-Host "Do you want to delete these files? (y/n)"
    if ($confirm -eq "y" -or $confirm -eq "Y") {
        $IncorrectFiles | ForEach-Object {
            if (Test-Path $_) {
                Write-Output "Deleting $_"
                Remove-Item -Force $_
            } else {
                Write-Output "File not found: $_ (no action taken)"
            }
        }
        Write-Output "Files deleted."
    } else {
        Write-Output "No files were deleted."
    }
} else {
    Write-Output "All files have the correct size and checksum."
}

Write-Output "File verification completed."

# Pause at the end
Read-Host "Press any key to exit..."
