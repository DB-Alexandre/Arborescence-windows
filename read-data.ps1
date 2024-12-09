Add-Type -AssemblyName System.Windows.Forms
Add-Type -AssemblyName System.Drawing

# Créer une fenêtre principale
$form = New-Object System.Windows.Forms.Form
$form.Text = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Explorateur de Dossiers"))
$form.Size = New-Object System.Drawing.Size(600, 400)
$form.StartPosition = "CenterScreen"

# Créer un TreeView pour afficher les dossiers
$treeView = New-Object System.Windows.Forms.TreeView
$treeView.Dock = "Fill"
$form.Controls.Add($treeView)

# Fonction pour charger les dossiers dans le TreeView
function Load-Folders {
    param ([System.Windows.Forms.TreeView]$TreeView, [string[]]$Folders)

    $rootNodes = @{}

    foreach ($folder in $Folders) {
        $folderPath = $folder.Trim('"') -replace '//', '\'

        $parts = $folderPath -split '\\'
        $currentPath = ""
        $parentNode = $null

        foreach ($part in $parts) {
            $currentPath = if ($currentPath) { "$currentPath\$part" } else { $part }

            if (-not $rootNodes.ContainsKey($currentPath)) {
                $node = New-Object System.Windows.Forms.TreeNode
                $node.Text = $part
                $node.Tag = $currentPath

                if ($parentNode) {
                    $parentNode.Nodes.Add($node)
                } else {
                    $TreeView.Nodes.Add($node)
                }

                $rootNodes[$currentPath] = $node
            }

            $parentNode = $rootNodes[$currentPath]
        }
    }
}

# Boîte de dialogue pour sélectionner le fichier .txt
$fileDialog = New-Object System.Windows.Forms.OpenFileDialog
$fileDialog.Filter = "Fichiers texte (*.txt)|*.txt"
$fileDialog.Title = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Sélectionner le fichier .txt contenant les dossiers"))

if ($fileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $filePath = $fileDialog.FileName
    try {
        # Charger les dossiers à partir du fichier sélectionné
        $folders = Get-Content -Path $filePath -Encoding UTF8
        Load-Folders -TreeView $treeView -Folders $folders
    } catch {
        [System.Windows.Forms.MessageBox]::Show(
            [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Impossible de lire le fichier sélectionné.")),
            [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Erreur")),
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error
        )
        exit
    }
} else {
    [System.Windows.Forms.MessageBox]::Show(
        [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Aucun fichier sélectionné. L'application va se fermer.")),
        [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Information")),
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    )
    exit
}

# Afficher la fenêtre
$form.Add_Shown({ $form.Activate() })
[void]$form.ShowDialog()
