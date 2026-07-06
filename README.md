Ce projet est un script d'automatisation conçu spécifiquement pour le modèle HP Laptop 17-cn3051nf. Il permet de créer une image ISO de Windows 10 personnalisée et optimisée, intégrant nativement tous les pilotes nécessaires pour ce matériel.
Note importante : Les pilotes inclus dans ce kit sont exclusivement destinés au modèle HP Laptop 17-cn3051nf.

Fonctionnalités du script
Préparation : Le script télécharge automatiquement le Windows Assessment and Deployment Kit (ADK) pour utiliser l'outil Oscdimg.
Configuration : Le script monte l'image ISO de base, permet de choisir la version de Windows, et extrait le contenu dans le dossier de travail.
Intégration des pilotes :
Le script monte le fichier install.wim pour y injecter les pilotes contenus dans votre dossier drivers, puis enregistre les modifications.
Le script effectue ensuite la même opération pour le fichier boot.wim, en injectant les pilotes de démarrage spécifiques situés dans le dossier boot_drivers, puis enregistre les modifications.
Finalisation : Après les modifications, le script démonte les images et génère un fichier ISO final prêt à l'emploi 
