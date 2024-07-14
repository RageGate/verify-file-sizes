import os

# Define the paths to the directories to be scanned
game_folder = os.path.abspath(".")
data_dir = os.path.join(game_folder, "data")
enGB_dir = os.path.join(data_dir, "enGB")
size_file_path = os.path.join(game_folder, "file_sizes.txt")

# List of directories to scan
directories_to_scan = [data_dir, enGB_dir]

print(f"Scanning directories: {directories_to_scan}")
print(f"Output file: {size_file_path}")

# Open the size file for writing
with open(size_file_path, 'w') as size_file:
    # Iterate through each directory
    for directory in directories_to_scan:
        if os.path.exists(directory):
            print(f"Scanning directory: {directory}")
            # Walk through the directory
            for root, _, files in os.walk(directory):
                for file in files:
                    file_path = os.path.join(root, file)
                    # Get the relative path to the game folder
                    relative_path = os.path.relpath(file_path, game_folder)
                    # Get the size of the file
                    file_size = os.path.getsize(file_path)
                    # Write the relative path and size to the size file
                    size_file.write(f"{relative_path} {file_size}\n")
                    print(f"Added file: {relative_path} with size: {file_size}")
        else:
            print(f"Directory does not exist: {directory}")

print(f"File sizes have been written to {size_file_path}")
