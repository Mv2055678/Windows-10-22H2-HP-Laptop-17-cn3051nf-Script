Vous pouvez télécharger le kit complet (9 Go) ici : ## Téléchargement https://www.mediafire.com/file/d8gejkqnpwjzhtz/script.zip/file
 propose un script PowerShell automatisé pour créer une image ISO de Windows 10 personnalisée, spécifiquement optimisée pour le HP Laptop 17-cn3051nf.
Pourquoi ce projet ?

L'installation de Windows 10 sur ce modèle peut parfois nécessiter l'intégration manuelle de pilotes spécifiques pour que tout le matériel (Wi-Fi, touchpad, contrôleur de stockage, etc.) soit reconnu dès le premier démarrage. Ce script automatise l'ensemble du processus pour vous faire gagner du temps et éviter les erreurs de manipulation.
Ce que fait le script :

 
   Fonctionnement du script

Le script agit comme un orchestrateur pour préparer votre environnement de travail :

    Téléchargement automatique : Récupération du Windows Assessment and Deployment Kit (ADK) nécessaire à l'utilisation de Oscdimg.

    Préparation : Détection automatique de votre ISO de base (déjà allégée avec Tiny11), montage et extraction du contenu dans le répertoire script/iso.

    Injection de pilotes :

        Système (install.wim) : Intégration automatique des pilotes stockés dans le dossier script\driver.

        Démarrage (boot.wim) : Intégration automatique des pilotes de démarrage stockés dans le dossier script\boot_drivers.

    Génération : Création d'un fichier ISO final prêt à être gravé sur une clé USB via Rufus ou un outil similaire.
