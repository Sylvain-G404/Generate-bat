# 🛠️ Outils de Structure de Projet pour IA

Ce dépôt contient deux scripts Batch (`.bat`) conçus pour simplifier la communication avec les Intelligences Artificielles (comme ChatGPT, Claude ou Copilot).

Lorsque vous travaillez sur de gros projets, copier-coller l'intégralité de vos fichiers ou expliquer l'arborescence à une IA devient vite fastidieux et sature sa mémoire (Context Window). Ces outils résolvent ce problème en générant une cartographie textuelle propre et légère de votre projet, **quelle que soit sa taille**.

---

## 💡 Pourquoi utiliser ces outils ?

- 📉 **Économie de tokens :** Évite de surcharger vos requêtes avec des fichiers volumineux.
- 🧠 **Meilleur contexte :** L'IA comprend instantanément l'organisation de votre code.
- ⚡ **Rapidité :** Génération automatique en un double-clic.

---

## 🗂️ 1. Générateur de Structure Locale

Ce script analyse votre dossier de travail actuel et génère un arbre textuel de vos fichiers et dossiers.

### 📖 Comment l'utiliser ?

1. Placez le script `.bat` à la racine de votre projet.
2. Double-cliquez sur le script.
3. Un dossier `Infos_Structure` est créé avec un fichier `structure.txt`.

### 🖥️ Exemple de rendu généré (`structure.txt`) :

```text
C:.\MonProjet
+--- src
|   +--- composants
|   |   \--- Button.js
|   \--- index.js
+--- public
|   \--- index.html
\--- package.json
```

---

## 🔗 2. Générateur de Liens de Dépôt GitHub

Ce script génère la même arborescence, mais remplace le nom des fichiers par **les liens URL directs vers votre dépôt GitHub en ligne**. L'IA peut ainsi cliquer directement sur le fichier qui l'intéresse pour lire son contenu.

### 📖 Comment l'utiliser ?

1. Faites un clic droit sur le fichier `.bat` et choisissez **Modifier**.
2. Remplissez votre pseudo à la ligne dédiée : `SET GITHUB_USER=VotrePseudoGitHub`.
3. Enregistrez et lancez le script en double-cliquant dessus.
4. Le résultat est **automatiquement copié dans votre presse-papiers** ! Vous n'avez plus qu'à faire un `CTRL+V` dans votre discussion avec l'IA.

### 🖥️ Exemple de rendu généré & copié :

```text
URL \ https://github.com
+--- https://github.com/tree/main/src
|   +--- https://github.com/tree/main/src/composants
|   |   \--- https://github.com/blob/main/src/composants/Button.js
|   \--- https://github.com/blob/main/src/index.js
\--- https://github.com/blob/main/src/package.json
```

---

## ⚙️ Configuration & Personnalisation

Les deux scripts possèdent une liste d'exclusion (`IGNORE_LIST`) en haut de leur code. Par défaut, ils ignorent les dossiers lourds ou inutiles pour l'IA (comme `node_modules`, `.git`, ou le `README.md`).

Si vous souhaitez ignorer d'autres éléments, modifiez simplement cette ligne dans les scripts :

```batch
SET IGNORE_LIST=node_modules;.git;exemple1.txt;dossier_test;votre_dossier_prive
```

_(Pensez à séparer chaque nom par un point-virgule `;`)_

---

## 👤 À propos de l'Auteur

Ce projet a été développé avec passion par **KiirrA** (Sylvain-G404), développeur indépendant spécialisé dans la création d'outils d'automatisation légers, d'architectures logicielles découplées et d'interfaces web dynamiques.

Si ce duo de scripts vous simplifie la vie avec vos IA de dev, n'hésitez pas à laisser une ⭐️ sur ce dépôt pour soutenir le projet !

- **GitHub :** [@Sylvain-G404](https://github.com/Sylvain-G404)
- **Portfolio :** [Mon-Portfolio-Temps](https://sylvain-g404.github.io/Mon-Portfolio-Temps/)

_« Communiquer proprement avec la machine pour coder sans limites. »_
