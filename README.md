Vous pouvez télécharger le kit complet (9 Go) ici : ## Téléchargement https://www.mediafire.com/file/d8gejkqnpwjzhtz/script.zip/file
 propose un script PowerShell automatisé pour créer une image ISO de Windows 10 personnalisée, spécifiquement optimisée pour le HP Laptop 17-cn3051nf.
Pourquoi ce projet ?

L'installation de Windows 10 sur ce modèle peut parfois nécessiter l'intégration manuelle de pilotes spécifiques pour que tout le matériel (Wi-Fi, touchpad, contrôleur de stockage, etc.) soit reconnu dès le premier démarrage. Ce script automatise l'ensemble du processus pour vous faire gagner du temps et éviter les erreurs de manipulation.
Ce que fait le script :

    Téléchargement automatique : Récupère le Windows Assessment and Deployment Kit (ADK) requis pour utiliser Oscdimg.

    Préparation de l'image : Monte votre ISO de base, extrait le contenu et prépare l'environnement de travail.

    Injection de pilotes : Intègre automatiquement les pilotes nécessaires dans install.wim (pour le système) et boot.wim (pour le démarrage).

    Génération ISO : Crée un fichier ISO final, prêt à être gravé sur une clé USB via Rufus ou un autre outil.

Utilisation :
    Assurez-vous d'avoir une image ISO de Windows 10 officielle.

    Placez vos pilotes spécifiques dans les dossiers drivers et boot_drivers.

    Exécutez le script PowerShell en mode Administrateur.

Avertissement :

    Les pilotes inclus dans ce kit sont exclusivement destinés au modèle HP Laptop 17-cn3051nf. L'utilisation sur un autre modèle peut entraîner des problèmes de stabilité.

    Pensez à vérifier le code source pour comprendre les opérations effectuées sur votre système.re.com/file/d8gejkqnpwjzhtz/script.zip/file) 
À propos de ce projet

Ce script propose une solution complète "tout-en-un" pour le HP Laptop 17-cn3051nf, combinant optimisation logicielle et compatibilité matérielle :

    Système optimisé : Utilisation d'une base allégée (Tiny11) pour obtenir un système plus rapide, plus fluide et moins encombré par les processus inutiles.

    Compatibilité matérielle totale : Injection automatisée via le script des pilotes nécessaires (Wi-Fi, touchpad, contrôleur de stockage, etc.) pour garantir que tout le matériel fonctionne parfaitement dès le premier démarrage sur ce modèle HP spécifique.
