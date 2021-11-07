# projet

LA BRANCHE A UTILISER SERA LA BRANCHE UPDATE

## Project setup
```
npm install
```

### Compiles and hot-reloads for development
```
npm start
```

### Customize configuration
See [Configuration Reference](https://cli.vuejs.org/config/).

## Pour te connecter à Git
- installe Git (pas GitHub, juste Git)
- créer un dossier sur ton ordi (sur le Bureau par ex)
- fait clique-droit "Git Bash Here" sur/dans ce nouveau dossier
- puis dans l'invite de commande tape les commandes suivantes:
  - `git init` **|** *fait de ton dossier un dossier pour git*
  - `git config --global user.name "TonNom"` **|** *tes infos jsp trop pq mais obligatoire*
  - `git config --global user.email "TonMail"`
  - `git remote add origin https://github.com/ayebD/ProjetM1.git`    **|** *te connecte au projet*
  - `git pull origin main`    **|** *télécharge / update les fichiers de ton dossier par ceux du projet branch main*

Yes ! Tu as maintenant les fichiers du projet actuel

## Pour ajouter des fichiers / les modifier
- écrit ton code, fait tes bails sur ton éditeur préféré
- une fois terminé tape les commandes suivantes
  - (`git remote add origin https://github.com/ayebD/ProjetM1.git`)
  - `git add .`    **|** *selectionne tous les fichiers de ton dossier*
  - `git commit -m "description stp met en des vrais"`    **|** *prépare l'envoie de tes nouveaux fichiers*
  - `git push -u origin main`    **|** *envoie les fichiers sur la branch main*

## Si tu as peur de casser le code avec de nouvelles fonctionnalités
Lorque tu implémentes de nouvelles choses, tu peux avoir peur que son application casse tout.
Pour éviter ça, tu peux créer une nouvelle branche qui sera séparer mais pas trop de la branche principale "main"
Pour se faire, tapes les commandes suivantes:
- `git branch nomDeTaBranch`    **|** *créer la nouvelle branche dans ton dossier*
- `git add .`    **|** *comme au dessus*
- `git commit -m "description de ce que t'as fait"`
- `git push -u origin nomDeTaBranch`    **|** *envoie tes dossier sur ta branche nouvellement créée*

Voilà, maintenant t'es un pro de Git (ou presque) !

LA BRANCHE A UTILISER SERA LA BRANCHE UPDATE

table Postgre sql pour le fonctionnement du programme

CREATE TABLE public.articles (
    id integer NOT NULL,
    text text,
    title text,
    image text,
    creator text
);

CREATE TABLE public.users (
    id integer NOT NULL,
    email text,
    password text,
    perm text DEFAULT 0 NOT NULL
);

Si le perm de la table users est à 1 il aura le droit de modifier les articiles.

Il faudra bien setup le api.js pour pouvoir se connecté à la base de donées Postgre
