# File Verification Tool

This repository contains a tool to verify the integrity of game files. It includes a PowerShell script and an executable that checks the sizes of files against expected values listed in a text file. If discrepancies are found, users are prompted to delete the incorrect files.

## Files

- `verify_files.ps1`: PowerShell script that verifies file sizes.
- `verify_files.exe`: Executable version of the PowerShell script.
- `file_sizes.txt`: List of files and their expected sizes.

## Usage Instructions

### Running the Tool

1. **Place Files in Game Folder**:
   - Ensure `verify_files.exe` and `file_sizes.txt` are in the root directory of the game folder.
   - Example structure:
     ```
     C:\Path\To\Game\Folder\
         verify_files.exe
         file_sizes.txt
         data\
         data\enGB\
         (Other game files and directories)
     ```

2. **Run the Executable**:
   - Double-click `verify_files.exe` to run the file verification process.
   - The tool will check the sizes of the files listed in `file_sizes.txt` and prompt you if any discrepancies are found.

### Modifying the PowerShell Script

If you need to make changes to the verification logic, you can modify `verify_files.ps1` and then regenerate the executable.

1. **Edit `verify_files.ps1`**:
   - Open `verify_files.ps1` in a text editor and make the necessary changes.

2. **Convert PowerShell Script to Executable**:
   - Ensure you have [PS2EXE](https://www.powershellgallery.com/packages/PS2EXE/1.0.3.2) installed. If not, install it using:
     ```powershell
     Install-Module -Name ps2exe -Scope CurrentUser
     ```
   - Place your custom icon file (`custom_icon.ico`) in the same directory as the script (optional).
   - Open PowerShell and navigate to the directory containing `verify_files.ps1`:
     ```powershell
     cd C:\Path\To\Game\Folder\
     ```
   - Run the following command to generate the executable:
     ```powershell
     Invoke-ps2exe .\verify_files.ps1 .\verify_files.exe -iconFile .\custom_icon.ico
     ```

3. **Distribute the Updated Executable**:
   - Replace the old `verify_files.exe` with the new one.
   - Ensure `verify_files.exe` and `file_sizes.txt` are placed in the root directory of the game folder as described above.

### Notes

- The `file_sizes.txt` should contain the list of files and their expected sizes in the following format:

Sure! Here is a README.md file for your GitHub repository:

markdown
Copy code
# File Verification Tool

This repository contains a tool to verify the integrity of game files. It includes a PowerShell script and an executable that checks the sizes of files against expected values listed in a text file. If discrepancies are found, users are prompted to delete the incorrect files.

## Files

- `verify_files.ps1`: PowerShell script that verifies file sizes.
- `verify_files.exe`: Executable version of the PowerShell script.
- `file_sizes.txt`: List of files and their expected sizes.

## Usage Instructions

### Running the Tool

1. **Place Files in Game Folder**:
   - Ensure `verify_files.exe` and `file_sizes.txt` are in the root directory of the game folder.
   - Example structure:
     ```
     C:\Path\To\Game\Folder\
         verify_files.exe
         file_sizes.txt
         data\
         data\enGB\
         (Other game files and directories)
     ```

2. **Run the Executable**:
   - Double-click `verify_files.exe` to run the file verification process.
   - The tool will check the sizes of the files listed in `file_sizes.txt` and prompt you if any discrepancies are found.

### Modifying the PowerShell Script

If you need to make changes to the verification logic, you can modify `verify_files.ps1` and then regenerate the executable.

1. **Edit `verify_files.ps1`**:
   - Open `verify_files.ps1` in a text editor and make the necessary changes.

2. **Convert PowerShell Script to Executable**:
   - Ensure you have [PS2EXE](https://www.powershellgallery.com/packages/PS2EXE/1.0.3.2) installed. If not, install it using:
     ```powershell
     Install-Module -Name ps2exe -Scope CurrentUser
     ```
   - Place your custom icon file (`custom_icon.ico`) in the same directory as the script (optional).
   - Open PowerShell and navigate to the directory containing `verify_files.ps1`:
     ```powershell
     cd C:\Path\To\Game\Folder\
     ```
   - Run the following command to generate the executable:
     ```powershell
     Invoke-ps2exe .\verify_files.ps1 .\verify_files.exe -iconFile .\custom_icon.ico
     ```

3. **Distribute the Updated Executable**:
   - Replace the old `verify_files.exe` with the new one.
   - Ensure `verify_files.exe` and `file_sizes.txt` are placed in the root directory of the game folder as described above.

# File Size Generator Tool

This repository contains a tool to generate a `file_sizes.txt` file which lists the sizes of files in specified directories. This is useful for verifying the integrity of game files by comparing their sizes against expected values.

## Files

- `generate_file_sizes.py`: Python script that scans specified directories and generates `file_sizes.txt`.
- `file_sizes.txt`: List of files and their sizes generated by the Python script.

## Usage Instructions

### Prerequisites

- Ensure you have Python installed on your system. You can download it from [python.org](https://www.python.org/).

### Running the Tool

1. **Place the Script in the Game Folder**:
   - Ensure `generate_file_sizes.py` is in the root directory of the game folder.
   - Example structure:
     ```
     C:\Path\To\Game\Folder\
         generate_file_sizes.py
         data\
         data\enGB\
         (Other game files and directories)
     ```

2. **Run the Script**:
   - Open a command prompt or terminal.
   - Navigate to the game folder:
     ```sh
     cd C:\Path\To\Game\Folder\
     ```
   - Run the Python script:
     ```sh
     python generate_file_sizes.py
     ```
   - This will generate a `file_sizes.txt` file in the same directory.

### Modifying the Script

If you need to change the directories to be scanned or the output format, you can modify `generate_file_sizes.py`.

1. **Edit `generate_file_sizes.py`**:
   - Open `generate_file_sizes.py` in a text editor and make the necessary changes.
   - The script is set to scan the `data` and `data/enGB` directories by default. You can add or modify directories in the `directories_to_scan` list.


### Notes

- The `file_sizes.txt` should contain the list of files and their expected sizes in the following format:
- relative/path/to/file1 expected_size1
- relative/path/to/file2 expected_size2

- Ensure that `verify_files.exe` and `file_sizes.txt` are always kept together in the root directory of the game folder for the tool to function correctly.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork this repository and submit pull requests with your changes.
