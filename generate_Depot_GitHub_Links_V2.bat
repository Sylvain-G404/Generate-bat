@echo off
title Generator Depot GitHub Links
echo ============================================================
echo   GENERATOR DEPOT GITHUB LINKS - AUTOMATIC VERSION
echo ============================================================

:: ==========================================
:: CONFIGURATION : Écris ton profil GitHub une fois pour toutes !
:: ==========================================
SET GITHUB_USER=
:: ==========================================
SET IGNORE_LIST=node_modules;.git;exemple1.txt;dossier_test;README.md
:: ==========================================

:: Récupération automatique du nom du dossier racine actuel
for %%I in ("%CD%") do set "NOM_PROJET=%%~nxI"

:: Construction automatique et propre de l'URL du dépôt
SET "GITHUB_REPO=https://github.com/%GITHUB_USER%/%NOM_PROJET%"

:: --- VÉRIFICATION SÉCURITÉ ---
if "%GITHUB_USER%"=="" goto :TUTO_ERROR
if "%GITHUB_USER%"=="VotrePseudoGitHub" goto :TUTO_ERROR

echo [+] Dossier detecte : %NOM_PROJET%
echo [+] URL cible calculee : %GITHUB_REPO%
echo.
echo Lancement de la generation...

if exist "Infos_Structure\links_github.txt" del "Infos_Structure\links_github.txt"
if not exist Infos_Structure mkdir Infos_Structure

powershell -NoProfile -Command ^
    "$repoBase = '%GITHUB_REPO%'.TrimEnd('/');" ^
    "$rawIgnore = '%IGNORE_LIST%';" ^
    "$ignoreArray = $rawIgnore.Split(';') | ForEach-Object { $_.Trim() };" ^
    "function Show-Tree($path, $indent='') {" ^
    "    $items = Get-ChildItem $path | Sort-Object PSIsContainer, Name;" ^
    "    for ($i = 0; $i -lt $items.Count; $i++) {" ^
    "        $item = $items[$i];" ^
    "        if ($ignoreArray -contains $item.Name) { continue; }" ^
    "        $isLast = ($i -eq ($items.Count - 1));" ^
    "        $relativePath = $item.FullName.Replace((Get-Location).Path, '').Replace('\', '/').TrimStart('/');" ^
    "        $junction = if ($isLast) { '\--- ' } else { '+--- ' };" ^
    "        if ($item.PSIsContainer) {" ^
    "            $url = $repoBase + '/tree/main/' + $relativePath;" ^
    "            $indent + $junction + $url;" ^
    "            $suffixe = if ($isLast) { '    ' } else { '|   ' };" ^
    "            Show-Tree $item.FullName ($indent + $suffixe);" ^
    "        } else {" ^
    "            $url = $repoBase + '/blob/main/' + $relativePath;" ^
    "            $indent + $junction + $url;" ^
    "        }" ^
    "    }" ^
    "};" ^
    "@('URL \ ' + $repoBase; Show-Tree '.') | Set-Content 'Infos_Structure\links_github.txt' -Encoding utf8"

type "Infos_Structure\links_github.txt" | clip
echo.
echo [+] Liens GitHub generes avec succes !
echo [+] Le resultat a ete copie dans le presse-papiers (Pret pour un CTRL+V).
echo.
pause
exit

:TUTO_ERROR
cls
echo ============================================================
echo   [!] ERREUR : PSEUDO GITHUB MANQUANT [!]
echo ============================================================
echo.
echo Veuillez specifier votre nom d'utilisateur dans le fichier .bat.
echo.
echo 1. Clic droit sur ce fichier, puis cliquez sur Modifier.
echo 2. Remplissez la ligne : SET GITHUB_USER=VotrePseudoGitHub
echo 3. Exemple : SET GITHUB_USER=Sylvain-G404
echo.
pause
exit

