---

# 📂 Directory Tree Viewer - PowerShell Script

## Description

This PowerShell script generates a clean and hierarchical directory tree structure for a specified folder, limited to **6 levels** of depth. It displays both folders and files with proper indentation, making it easier to visualize complex file systems directly in the console.

## Features

- Recursively scans a directory and its subdirectories up to 6 levels.
- Differentiates between directories and files for clarity.
- Outputs a structured and readable tree format with indentation.
- Easy to customize for deeper levels or specific use cases.

## Usage

1. Clone the repository or copy the script.
2. Open the script in a PowerShell editor or terminal.
3. Replace `C:\your\route\` with your target directory path.
4. Run the script to view the directory tree in the console.

### Example Output
For a folder structure like this:
```
C:\Example
├── Folder1
│   ├── SubFolder1
│   │   └── File1.txt
│   └── File2.txt
├── Folder2
└── File3.txt
```

The script will produce:
```
Arborescence de C:\Example :
[DIR] Folder1
        [DIR] SubFolder1
             File1.txt
        File2.txt
[DIR] Folder2
     File3.txt
```

## Customization

- **Depth Limit**: Adjust the `$MaxDepth` parameter in the script to increase or decrease the depth limit.
- **Output Format**: Modify the `Write-Output` statements to customize the visual style of the tree.

## Requirements

- PowerShell 5.0 or higher
- A Windows environment (may also work on other platforms with PowerShell Core)

## License

This project is licensed under the [MIT License](LICENSE).

---
