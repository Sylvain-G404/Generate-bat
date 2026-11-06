# 🗺️ Windows IA & Project Structure Generator

Un duo de micro-utilitaires d'automatisation légers pour Windows (`.bat`) spécialement conçus pour **simplifier et booster vos échanges avec les IA** (ChatGPT, Claude, Copilot...).

En un double-clic, ils cartographient votre projet et génèrent l'arborescence exacte de vos fichiers ainsi que leurs **liens absolus vers votre dépôt GitHub**. L'IA peut ainsi instantanément visualiser votre architecture et aller lire chirurgicalement le code source de chaque fichier !

---

## 🚀 Fonctionnalités

- **Optimisé pour les Prompts IA :** Génère un format d'arborescence épuré, graphique et parfaitement structuré, idéal à copier-coller en tête de vos prompts de développement.
- **Accès Chirurgical :** Convertit votre structure locale en une liste d'URLs GitHub absolues (`/blob/main/...` ou `/tree/main/...`). L'IA clique et lit votre code en temps réel sans que vous ayez à lui copier-coller tout le projet !
- **Filtre Profond Intelligent :** Ignore automatiquement les dossiers et caches lourds ou inutiles (`node_modules`, `.git`, `target` de Rust/Tauri, fichiers `.exe`...) pour ne pas saturer vos contextes de discussion.
- **Zéro Perte de Temps :** Le script de liens copie automatiquement le résultat directement dans votre presse-papiers Windows (`clip`). Exécutez, faites `CTRL + V` dans votre IA, et codez !
- **Gestion du Cache Discord & Réseaux :** Les scripts intègrent une configuration Open Graph pour afficher de superbes cartes d'aperçu graphiques (embeds) lors de vos partages de liens.

---

## 📁 Les 2 Outils Disponibles

### 1️⃣ `generate_structure_V2.bat` (Vision Locale)

Génère une cartographie textuelle propre et ordonnée de l'organisation physique de votre ordinateur.

- **Sortie :** `Infos_Structure/structure.txt`

### 2️⃣ `generate_GitHub_Links.bat` (Vision IA & Liens Distants)

Calcule dynamiquement l'URL de votre dépôt GitHub à partir de votre profil et du nom du dossier, applique le filtrage profond des fichiers inutiles, génère l'arbre d'URLs absolues et l'envoie dans votre presse-papiers.

- **Sortie :** `Infos_Structure/links_github.txt` (et copie automatique !)

---

## 🛠️ Comment les utiliser ?

1. Téléchargez les fichiers `.bat` depuis ce dépôt.
2. Placez-les à la **racine** du dossier de votre projet.
3. Configurez les scripts selon vos besoins (voir les sections de configuration ci-dessous).
4. Double-cliquez sur le script de votre choix pour générer les rapports dans le dossier `Infos_Structure/`.

---

### ⚙️ Configuration de la liste d'exclusion (`SET IGNORE_LIST`)

Le script `generate_structure_V2.bat` vous permet de masquer les fichiers ou dossiers volumineux et inutiles afin de garder un rendu propre.

- **Action :** Ouvrez le fichier (Clic droit -> Modifier) et localisez la variable au début du script.
- **Règle de syntaxe :** Écrivez les noms exacts des dossiers ou fichiers à ignorer, séparés **uniquement par des points-virgules (`;`)**, sans aucun crochet, espace ou guillemet.

```batch
:: ==========================================
:: CONFIGURATION : Éléments à exclure de l'affichage
:: ==========================================
SET IGNORE_LIST=node_modules;.git;exemple1.txt;dossier_test;README.md
:: ==========================================
```

### 📁 Rendu visuel généré pour la structure locale (`structure.txt`) :

```text
C:.\Mon_Super_Projet
|   .gitignore
|   index.html
|   README.md
|
+---JavaScript
│       main.js
│
\---Style
        style.css
```

---

### ⚙️ Configuration du profil distant (`SET GITHUB_USER`)

Le script `generate_GitHub_Links.bat` nécessite votre identifiant pour calculer dynamiquement les URLs absolues de votre code.

- **Action :** Ouvrez le fichier (Clic droit -> Modifier).
- **Règle de syntaxe :** Renseignez votre nom d'utilisateur directement après le signe égal.

```batch
:: ==========================================
:: CONFIGURATION : Écris ton profil GitHub une fois pour toutes !
:: ==========================================
SET GITHUB_USER=VotrePseudoGitHub
```

### 🤖 Rendu visuel généré pour l'IA (`links_github.txt`) :

```text
URL \ https://github.com
|   \--- https://github.com/blob/main/index.html
+--- https://github.com/tree/main/JavaScript

|   |   \--- https://github.com/blob/main/JavaScript/main.js
\--- https://github.com/tree/main/Style
        \--- https://github.com/blob/main/Style/style.css
```

---

## 👤 À propos de l'Auteur

Ce projet a été développé avec passion par **KiirrA** (Sylvain-G404), développeur indépendant spécialisé dans la création d'outils d'automatisation légers, d'architectures logicielles découplées et d'interfaces web dynamiques.

Si ce duo de scripts vous simplifie la vie avec vos IA de dev, n'hésitez pas à laisser une ⭐️ sur ce dépôt pour soutenir le projet !

- **GitHub :** [@Sylvain-G404](https://github.com/Sylvain-G404)
- **Portfolio :** [Mon-Portfolio-Temps](https://sylvain-g404.github.io/Mon-Portfolio-Temps/)

_« Communiquer proprement avec la machine pour coder sans limites. »_
