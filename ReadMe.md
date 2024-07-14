# File Verification Tool

This repository contains tools to verify the integrity of game files. It includes a PowerShell script, an executable, and a Python script to generate the necessary file sizes list.

## Files

- `verify_files.ps1`: PowerShell script that verifies file sizes.
- `verify_files.exe`: Executable version of the PowerShell script.
- `file_sizes.txt`: List of files and their expected sizes.
- `generate_file_sizes.py`: Python script to generate `file_sizes.txt`.
- `custom_icon.ico`: Custom icon for the executable.

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

### Generating `file_sizes.txt`

If you have many files to verify, you can quickly generate `file_sizes.txt` using the provided Python script.

1. **Ensure Python is Installed**:
   - Make sure Python is installed on your system. You can download it from [python.org](https://www.python.org/).

2. **Run the Python Script**:
   - Place `generate_file_sizes.py` in the root directory of the game folder.
   - Example structure:
     ```
     C:\Path\To\Game\Folder\
         generate_file_sizes.py
         data\
         data\enGB\
         (Other game files and directories)
     ```
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

### Modifying the Scripts

#### Modifying the Python Script

If you need to change the directories to be scanned or the output format, you can modify `generate_file_sizes.py`.

1. **Edit `generate_file_sizes.py`**:
   - Open `generate_file_sizes.py` in a text editor and make the necessary changes.
   - The script is set to scan the `data` and `data/enGB` directories by default. You can add or modify directories in the `directories_to_scan` list.

#### Modifying the PowerShell Script

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

## Notes

- The `file_sizes.txt` should contain the list of files and their expected sizes in the following format:
- relative/path/to/file1 expected_size1
- relative/path/to/file2 expected_size2

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please fork this repository and submit pull requests with your changes.
