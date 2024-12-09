---

# 📂 Directory Management Scripts - PowerShell

## Description

Ce dépôt contient deux scripts PowerShell pour gérer et explorer des dossiers, chacun offrant une interface graphique conviviale et des fonctionnalités utiles pour l'automatisation et la visualisation \:

1. **Exportation des dossiers vers un fichier `.txt`** avec encodage UTF-8.
2. **Exploration de dossiers simulée via une interface graphique** basée sur un fichier `.txt`.

---

## Scripts Inclus

### **1. export-data.ps1**  
Un script PowerShell permettant d'explorer un répertoire et d'enregistrer uniquement les chemins des **dossiers** dans un fichier `.txt`. Ce script inclut une interface graphique pour :

- Sélectionner un répertoire de départ.
- Choisir l'emplacement et le nom du fichier `.txt` de sortie.
- Exporter tous les chemins des dossiers avec des **guillemets** et en encodage **UTF-8**.

#### **Caractéristiques** :
- Exporte uniquement les dossiers (pas les fichiers).
- Ajoute des guillemets autour des chemins.
- Convertit les backslashes (`\`) en double-slashes (`//`) pour compatibilité.

#### **Exemple de sortie** :
```txt
"C://Users//Public"
"C://Program Files//Microsoft"
"C://Windows//System32"
```

#### **Instructions d'utilisation** :
1. Exécutez le script.
2. Une première boîte de dialogue vous permettra de sélectionner le dossier à explorer.
3. Une deuxième boîte de dialogue vous permettra de choisir où enregistrer le fichier `.txt`.
4. Le fichier exporté contiendra les chemins de tous les dossiers.

---

### **2. read-data.ps1**  
Un script PowerShell offrant une interface graphique simulant un explorateur Windows. Ce script lit un fichier `.txt` (généré par le premier script ou un autre fichier de même format) contenant des chemins de dossiers et affiche une arborescence interactive.

#### **Caractéristiques** :
- Affiche une **interface graphique** avec un `TreeView` pour visualiser les dossiers.
- Permet de **naviguer** dans les dossiers comme dans un explorateur Windows.
- Inclut une boîte de dialogue pour **sélectionner un fichier `.txt`** contenant les chemins des dossiers.
- Prend en charge les chemins encodés en **UTF-8**.

#### **Instructions d'utilisation** :
1. Exécutez le script.
2. Une boîte de dialogue vous permettra de sélectionner un fichier `.txt` contenant les chemins de dossiers.
3. Une fois chargé, les dossiers seront affichés dans une interface graphique sous forme d'arborescence.

---

## Prérequis

- **Système d'exploitation** : Windows (PowerShell requis).
- **Version de PowerShell** : 5.1 ou supérieure (ou PowerShell Core pour des plateformes multi-OS).
- **Encodage** : UTF-8 pour tous les fichiers `.txt`.

---

## Installation

1. Clonez ce dépôt ou téléchargez les fichiers directement.
2. Assurez-vous que les fichiers `.ps1` sont accessibles depuis votre environnement PowerShell.
3. Exécutez les scripts avec PowerShell et suivez les instructions dans l'interface graphique.

---

## Utilisation

1. **Exportation des dossiers :**
   - Lancez `Export-Folders.ps1`.
   - Sélectionnez le dossier à explorer.
   - Choisissez l'emplacement pour enregistrer le fichier `.txt`.

2. **Exploration des dossiers :**
   - Lancez `Explore-Folders.ps1`.
   - Sélectionnez un fichier `.txt` contenant des chemins de dossiers.
   - Naviguez dans l'interface graphique.

---

## Exemple de Cas d'Utilisation

- **Organisation des données** : Exportez l'arborescence de dossiers pour les documentations ou les audits.
- **Simulation d'explorateur** : Naviguez dans des chemins sans interagir directement avec l'explorateur Windows.

---

## Contribuer

Les contributions sont les bienvenues ! Si vous avez des idées pour améliorer ces scripts ou des rapports de bogues, n'hésitez pas à créer une **issue** ou une **pull request**.

---
