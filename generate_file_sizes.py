import os
import hashlib

# Define the paths to the directories to be scanned
game_folder = os.path.abspath(".")
data_dir = os.path.join(game_folder, "data")
enGB_dir = os.path.join(data_dir, "enGB")
size_file_path = os.path.join(game_folder, "file_sizes.txt")

# List of directories to scan
directories_to_scan = [game_folder, data_dir, enGB_dir]

# List of directories to exclude
excluded_directories = {"WTF", "Cache", "Logs", "Interface"}

# Function to compute MD5 checksum
def compute_md5(file_path):
    hash_md5 = hashlib.md5()
    with open(file_path, "rb") as f:
        for chunk in iter(lambda: f.read(4096), b""):
            hash_md5.update(chunk)
    return hash_md5.hexdigest()

# Open the size file for writing
with open(size_file_path, 'w') as size_file:
    # Iterate through each directory
    for directory in directories_to_scan:
        if os.path.exists(directory):
            print(f"Scanning directory: {directory}")
            # Walk through the directory
            for root, dirs, files in os.walk(directory):
                # Modify the dirs list in-place to exclude unwanted directories
                dirs[:] = [d for d in dirs if d not in excluded_directories]
                for file in files:
                    file_path = os.path.join(root, file)
                    # Get the relative path to the game folder
                    relative_path = os.path.relpath(file_path, game_folder)
                    # Get the size of the file
                    file_size = os.path.getsize(file_path)
                    # Get the MD5 checksum of the file
                    file_md5 = compute_md5(file_path)
                    # Write the relative path, size, and MD5 checksum to the size file
                    size_file.write(f"{relative_path} {file_size} {file_md5}\n")
                    print(f"Added file: {relative_path} with size: {file_size} and MD5: {file_md5}")
        else:
            print(f"Directory does not exist: {directory}")

print(f"File sizes and checksums have been written to {size_file_path}")
