Add-Type -AssemblyName System.Windows.Forms

# Boîte de dialogue pour choisir le dossier de départ
$folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
$folderBrowser.Description = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Sélectionnez le dossier à explorer"))

if ($folderBrowser.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $BasePath = $folderBrowser.SelectedPath
} else {
    [System.Windows.Forms.MessageBox]::Show(
        [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Aucun dossier sélectionné. L'application va se fermer.")),
        "Information",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    )
    exit
}

# Boîte de dialogue pour choisir l'emplacement du fichier de sortie
$saveFileDialog = New-Object System.Windows.Forms.SaveFileDialog
$saveFileDialog.Filter = "Fichiers texte (*.txt)|*.txt"
$saveFileDialog.Title = [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Enregistrer le fichier des dossiers"))
$saveFileDialog.FileName = "dossiers.txt"

if ($saveFileDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
    $OutputFile = $saveFileDialog.FileName
} else {
    [System.Windows.Forms.MessageBox]::Show(
        [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Aucun emplacement de fichier sélectionné. L'application va se fermer.")),
        "Information",
        [System.Windows.Forms.MessageBoxButtons]::OK,
        [System.Windows.Forms.MessageBoxIcon]::Information
    )
    exit
}

# Fonction pour exporter les dossiers
function Export-FolderPaths {
    param (
        [string]$Path,
        [string]$OutputFile
    )

    # Récupérer tous les dossiers récursivement
    Get-ChildItem -Path $Path -Directory -Recurse -ErrorAction SilentlyContinue |
        ForEach-Object {
            # Ajouter des guillemets autour du chemin et remplacer les backslashes (\) par des double-slashes (//)
            '"' + ($_.FullName -replace '\\', '//') + '"'
        } | Out-File -FilePath $OutputFile -Encoding UTF8
}

# Exécuter la fonction d'exportation
Export-FolderPaths -Path $BasePath -OutputFile $OutputFile

# Message de confirmation
[System.Windows.Forms.MessageBox]::Show(
    [System.Text.Encoding]::UTF8.GetString([System.Text.Encoding]::Default.GetBytes("Export terminé avec succès : $OutputFile")),
    "Succès",
    [System.Windows.Forms.MessageBoxButtons]::OK,
    [System.Windows.Forms.MessageBoxIcon]::Information
)
