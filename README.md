Vous pouvez télécharger le kit complet (9 Go) ici : ## Téléchargement https://www.mediafire.com/file/d8gejkqnpwjzhtz/script.zip/file
 propose un script PowerShell automatisé pour créer une image ISO de Windows 10 personnalisée, spécifiquement optimisée pour le HP Laptop 17-cn3051nf.
Pourquoi ce projet ?

L'installation de Windows 10 sur ce modèle nécessite souvent l'intégration manuelle de pilotes spécifiques (Wi-Fi, touchpad, contrôleur de stockage, etc.) pour que tout le matériel soit reconnu dès le premier démarrage. Ce script automatise l'ensemble du processus pour vous faire gagner du temps et éviter les erreurs de manipulation.
Fonctionnement du script

Le script agit comme un orchestrateur pour préparer votre environnement de travail. Une fois le dossier téléchargé, il suffit d'exécuter le script en mode Administrateur et il s'occupe de tout.
Le script effectue les opérations suivantes :

    Téléchargement automatique : Récupération du Windows Assessment and Deployment Kit (ADK) nécessaire à l'utilisation de Oscdimg.

    Préparation : Détection automatique de votre ISO de base (déjà allégée avec Tiny11) située dans le dossier, puis montage et extraction du contenu dans le répertoire script/iso.

    Injection de pilotes :

        Système (install.wim) : Intégration automatique tout les drivers pour ce model touchepad audio etplei d'autre script\driver.

        Démarrage (boot.wim) : Intégration automatique des pilotes de démarrage stockés dans le dossier script\boot_drivers.

    Génération : Création d'un fichier ISO final, prêt à être gravé sur une clé USB via Rufus ou un outil similaire. Note importante : Pour garantir le bon fonctionnement du script, veuillez ne supprimer aucun fichier ou dossier présent dans le répertoire script. L'organisation des dossiers est nécessaire pour que le script puisse localiser correctement les pilotes et l'image ISO.

bon journé cher utilisateur 
