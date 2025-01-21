# Nettoyer des fichiers trop volumineux d'un repo git
     - Lister les fichiers par taille dans le repo (ici les 100 plus gros)
         -
           ```bash
           # Pour OSX
           brew install coreutils

           git rev-list --objects --all --missing=print |
             git cat-file --batch-check='%(objecttype) %(objectname)
%(objectsize) %(rest)' |
             sed -n 's/^blob //p' |
             grep -vF --file=<(git ls-tree -r HEAD | awk '{print $3}') |
sort --numeric-sort --key=2 |
             $(command -v gnumfmt || echo gnumfmt) --field=2 --to=iec-i
--suffix=B --padding=7 --round=nearest |
             head -100
             >> big blobs.txt
           ```
     - Utilisation de [BFG
repo-cleaner](https://rtyley.github.io/bfg-repo-cleaner/) à télécharger
         -
           ```bash
           # importance du --mirror
           git clone --mirror https://github.com/orianebro/PhD_Oriane.git

           java -jar bfg-1.14.0.jar --help

           # Apres nettoyage du fichier trouvé ci-dessus en ne gardant
que les blobs
           java -jar bfg-1.14.0.jar --strip-blobs-with-ids big_blobs.txt
PhD_oriane.git
           # On efface les fichiers plus gros que 5Mo
           java -jar bfg-1.14.0.jar --strip-blobs-bigger-than 5M
PhD_oriane.git

           git reflog expire --expire=now --all && git gc --prune=now
--aggressive
           ```