# Path to the game folder (the script should be placed in the game folder)
$GameFolder = Get-Location
# Path to the file containing the list of files and their expected sizes
$SizeFile = Join-Path $GameFolder "file_sizes.txt"

# Function to get the size of a file
function Get-FileSize {
    param (
        [string]$FilePath
    )
    if (Test-Path $FilePath) {
        (Get-Item $FilePath).length
    } else {
        0
    }
}

# Array to hold files with incorrect sizes
$IncorrectFiles = @()

# Read the size file line by line
Get-Content $SizeFile | ForEach-Object {
    $line = $_
    # Extract file path and expected size from the line
    $parts = $line -split ' '
    $FilePath = $parts[0]
    $ExpectedSize = [System.Int64]$parts[1]

    # Get the full path of the file
    $FullFilePath = Join-Path $GameFolder $FilePath

    # Get the actual size of the file
    $ActualSize = Get-FileSize -FilePath $FullFilePath

    # Compare the actual size with the expected size
    if ($ActualSize -ne $ExpectedSize) {
        Write-Output "File size mismatch for $FullFilePath (expected: $ExpectedSize, actual: $ActualSize)"
        $IncorrectFiles += $FullFilePath
    }
}

# Display the list of files with incorrect sizes
if ($IncorrectFiles.Count -ne 0) {
    Write-Output "The following files have incorrect sizes:"
    $IncorrectFiles | ForEach-Object { Write-Output $_ }

    # Prompt the user to confirm deletion
    $confirm = Read-Host "Do you want to delete these files? (y/n)"
    if ($confirm -eq "y" -or $confirm -eq "Y") {
        $IncorrectFiles | ForEach-Object {
            Write-Output "Deleting $_"
            Remove-Item -Force $_
        }
        Write-Output "Files deleted."
    } else {
        Write-Output "No files were deleted."
    }
} else {
    Write-Output "All files have the correct size."
}

Write-Output "File verification completed."

# Pause at the end
Read-Host "Press any key to exit..."
