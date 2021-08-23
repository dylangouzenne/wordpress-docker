# wordpress-docker

## Environnement de développement local 

* Cloner le projet dans un répertoire local : 
`git clone git@gitlab-simplon.akiros.school:adebande/wordpress-docker.git`
* Naviguer dans le dossier du projet et lancer docker-compose : 
`cd wordpress-docker && docker-compose up -d`
* Une fois les conteneurs lancés, le site sera accessible à l'adresse http://localhost:8080
* Pour stopper les conteneurs :
`docker-compose down`


## Régler les problèmes de permissions

Si vous rencontrez des erreurs du type "permission denied" lors de l'édition ou la lecture de certains fichiers, exécutez la commande suivante : `sudo chmod +x ./scripts/permissions.sh && sudo ./scripts/permissions.sh`

:warning: **Ne modifiez jamais manuellement les fichiers contenus dans le dossier `db/` !**
