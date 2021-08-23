# wordpress-docker

## Mettre en place l'environnement local 

* Cloner le projet dans un répertoire local : <br/>
`$ git clone git@gitlab-simplon.akiros.school:adebande/wordpress-docker.git`
* Naviguer dans le dossier du projet et lancer les conteneurs avec Docker Compose : <br/>
`$ cd wordpress-docker && docker-compose up -d`
* Une fois les conteneurs lancés, le site sera accessible à l'adresse http://localhost:8080 . Si un message d'erreur concernant l'accès à la base de données s'affiche, patienter quelques secondes et rafraichir la page. 
* Pour stopper les conteneurs : <br/>
`$ docker-compose down`


## Régler les problèmes de permissions

Si vous rencontrez des erreurs du type "permission denied" lors de l'édition ou la lecture de certains fichiers, exécutez la commande suivante :<br/>
`$ sudo chmod +x ./scripts/permissions.sh && sudo ./scripts/permissions.sh`

:warning: **Ne modifiez jamais manuellement les fichiers contenus dans le dossier `db/` !**
