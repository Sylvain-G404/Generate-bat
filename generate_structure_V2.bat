@echo off
echo Generation de la structure locale (Fichiers puis Dossiers)...

:: ==========================================
:: CONFIGURATION : Éléments à exclure de l'affichage
:: ==========================================
SET IGNORE_LIST=node_modules;.git;exemple1.txt;dossier_test;README.md
:: ==========================================

if exist "Infos_Structure\structure.txt" del "Infos_Structure\structure.txt"
if not exist Infos_Structure mkdir Infos_Structure

powershell -NoProfile -Command ^
    "$nomProjet = Split-Path '%CD%' -Leaf;" ^
    "$rawIgnore = '%IGNORE_LIST%';" ^
    "$ignoreArray = $rawIgnore.Split(';') | ForEach-Object { $_.Trim() };" ^
    "function Show-Tree($path, $indent='') {" ^
    "    $items = Get-ChildItem $path | Sort-Object PSIsContainer, Name;" ^
    "    for ($i = 0; $i -lt $items.Count; $i++) {" ^
    "        $item = $items[$i];" ^
    "        if ($ignoreArray -contains $item.Name) { continue; }" ^
    "        $isLast = ($i -eq ($items.Count - 1));" ^
    "        $junction = if ($isLast) { '\--- ' } else { '+--- ' };" ^
    "        if ($item.PSIsContainer) {" ^
    "            $indent + $junction + $item.Name;" ^
    "            $suffixe = if ($isLast) { '    ' } else { '|   ' };" ^
    "            Show-Tree $item.FullName ($indent + $suffixe);" ^
    "        } else {" ^
    "            $indent + $junction + $item.Name;" ^
    "        }" ^
    "    }" ^
    "};" ^
    "$rootStr = 'C:.\' + $nomProjet;" ^
    "@($rootStr; Show-Tree '.') | Set-Content 'Infos_Structure\structure.txt' -Encoding utf8"

echo Structure locale mise a jour proprement dans Infos_Structure\structure.txt !
pause
