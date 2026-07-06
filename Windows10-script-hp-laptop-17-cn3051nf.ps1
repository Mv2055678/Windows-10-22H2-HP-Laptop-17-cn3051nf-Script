# 1. Auto-élévation : Vérifier les droits administrateur
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs
    exit
}

Set-ExecutionPolicy Bypass -Scope Process -Force
$ErrorActionPreference = "Stop"

try {
    # 2. Recherche du dossier "script"
    $ScriptDir = $null
    $AllDrives = [System.IO.DriveInfo]::GetDrives() | Where-Object { $_.DriveType -eq 'Fixed' }
    foreach ($Drive in $AllDrives) {
        $Root = $Drive.Name
        $Found = Get-ChildItem -Path $Root -Filter "script" -Directory -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq "script" } | Select-Object -First 1
        if ($Found) { $ScriptDir = $Found.FullName; break }
    }
    if (-not $ScriptDir) { throw "Dossier 'script' introuvable." }

  # 3. Installation de l'ADK
    $AdkSetup = "$ScriptDir\adksetup.exe"
    $OscdimgPath = "C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Deployment Tools\amd64\Oscdimg\oscdimg.exe"

    if (!(Test-Path $OscdimgPath)) {
        Write-Host "Lancement de l'installation de l'ADK..." -ForegroundColor Cyan
        
        # On lance le setup présent dans le dossier script
        if (Test-Path $AdkSetup) {
            # On lance le processus et on attend qu'il se ferme
            Start-Process -FilePath $AdkSetup -Wait -NoNewWindow
            
            Write-Host "Veuillez terminer l'installation manuellement si la fenêtre s'ouvre." -ForegroundColor Yellow
            
            # On attend que le fichier apparaisse sur le disque
            while (!(Test-Path $OscdimgPath)) {
                Write-Host "En attente de la fin de l'installation..." -ForegroundColor Gray
                Start-Sleep -Seconds 5
            }
        } else {
            Write-Host "Erreur : adksetup.exe est introuvable dans le dossier script." -ForegroundColor Red
            Read-Host "Appuie sur Entrée pour quitter"
            exit
        }
    }
    Write-Host "ADK détecté : $OscdimgPath" -ForegroundColor Green

    # 4. Montage et Extraction
    $IsoPath = "$ScriptDir\Windows.iso"
    $IsoExtractDir = "$ScriptDir\iso"
    if (!(Test-Path $IsoExtractDir)) { New-Item -ItemType Directory -Path $IsoExtractDir -Force }

    Write-Host "Montage de l'ISO..." -ForegroundColor Cyan
    $MountedIso = Mount-DiskImage -ImagePath $IsoPath -PassThru
    $DriveLetter = ($MountedIso | Get-Volume).DriveLetter
    Copy-Item -Path "$($DriveLetter):\*" -Destination $IsoExtractDir -Recurse -Force
    Dismount-DiskImage -ImagePath $IsoPath
    Start-Process -FilePath "attrib" -ArgumentList "-r `"$IsoExtractDir\*`" /s /d" -Wait

    # 5. Injection des drivers
    $WimFile = "$IsoExtractDir\sources\install.wim"
    $MountDir = "$ScriptDir\Mount"
    if (!(Test-Path $MountDir)) { New-Item -ItemType Directory -Path $MountDir -Force }

    Write-Host "--- Liste des index dans install.wim ---" -ForegroundColor Yellow
    Dism /Get-WimInfo /WimFile:$WimFile
    $Index = Read-Host "Entrez le numéro de l'index à modifier"

    # Injection
    Write-Host "Injection des drivers..." -ForegroundColor Cyan
    Dism /Mount-Wim /WimFile:$WimFile /Index:$Index /MountDir:$MountDir
    Dism /Image:$MountDir /Add-Driver /Driver:"$ScriptDir\drivers" /Recurse
    Dism /Unmount-Wim /MountDir:$MountDir /Commit

    # 6. Création ISO final
    Write-Host "Création de l'ISO final..." -ForegroundColor Green
    & $OscdimgPath -m -o -u2 -udfver102 -bootdata:2#p0,e,b"$IsoExtractDir\boot\etfsboot.com"#pEF,e,b"$IsoExtractDir\efi\microsoft\boot\efisys.bin" "$IsoExtractDir" "$ScriptDir\Windows_Final.iso"
    
    Write-Host "Opération terminée ! Ton ISO est prêt." -ForegroundColor Green
}
catch {
    Write-Host "ERREUR : $($_.Exception.Message)" -ForegroundColor Red
}

Read-Host "Appuie sur Entrée pour quitter"