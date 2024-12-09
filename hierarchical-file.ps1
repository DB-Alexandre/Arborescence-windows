# Set base path (replace with your target directory)
$RootPath = "U:\"

# Recursive function for displaying the file tree
function Get-DirectoryTree {
    param (
        [string]$Path,
        [int]$Depth = 1,
        [int]$MaxDepth = 6,
        [string]$Prefix = ""
    )

    # If maximum depth is reached, stop
    if ($Depth -gt $MaxDepth) {
        return
    }

    # List folders and files in the path
    $Entries = Get-ChildItem -Path $Path | Sort-Object -Property PSIsContainer, Name

    foreach ($Entry in $Entries) {
        if ($Entry.PSIsContainer) {
            # Add an entry for the folder
            Write-Output "$Prefix[DIR] $($Entry.Name)"

            # Call recursively for subfolders
            Get-DirectoryTree -Path $Entry.FullName -Depth ($Depth + 1) -MaxDepth $MaxDepth -Prefix ("$Prefix    ")
        } else {
            # Add an entry for files
            Write-Output "$Prefix     $($Entry.Name)"
        }
    }
}

# Execute function
Write-Output "Arborescence de $RootPath :"
Get-DirectoryTree -Path $RootPath
