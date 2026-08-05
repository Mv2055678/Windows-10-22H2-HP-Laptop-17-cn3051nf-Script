Windows-10-22H2-HP-portable-17-cn3xxx
Ce projet propose un script PowerShell automatisé pour créer une image ISO de Windows 10 personnalisée, spécifiquement optimisée pour le HP Laptop 17-cn3051nf.

Pourquoi ce projet ?
L'installation de Windows 10 sur ce modèle nécessite souvent l'intégration manuelle de pilotes spécifiques (Wi-Fi, touchpad, contrôleur de stockage, etc.) pour que tout le matériel soit reconnu dès le premier démarrage. Ce script automatise l'ensemble du processus pour vous faire gagner du temps et éviter les erreurs de manipulation.

Téléchargement
Vous pouvez télécharger le kit complet (9 Go) contenant les pilotes extraits d'une image de récupération officielle et l'environnement nécessaire ici :
👉 https://www.mediafire.com/file/d8gejkqnpwjzhtz/script.zip/file 

Fonctionnement du script
Le script agit comme un orchestrateur pour préparer votre environnement de travail. Une fois le dossier téléchargé, il suffit de l'exécuter en mode Administrateur. Le script effectue les opérations suivantes :

Téléchargement automatique : Récupération du Windows Assessment and Deployment Kit (ADK) nécessaire à l'utilisation de Oscdimg.
Préparation : Détection automatique de votre ISO de base (allégée avec Tiny11) située dans le dossier, puis montage et extraction du contenu dans le répertoire script/iso.
Injection de pilotes :
Système (install.wim) : Intégration automatique de tous les pilotes spécifiques pour ce modèle (audio, touchpad, etc.) situés dans script/driver.
Démarrage (boot.wim) : Intégration automatique des pilotes de démarrage stockés dans script/boot_drivers (notamment le touchpad pour l'installation).
Génération : Création d'un fichier ISO final, prêt à être gravé sur une clé USB via Rufus.
Note importante
Pour garantir le bon fonctionnement du script, veuillez ne supprimer aucun fichier ou dossier présent dans le répertoire script. L'organisation des dossiers est indispensable pour que le script puisse localiser correctement les pilotes et l'image ISO. 
bon jeuner cher utilisateur 😊
