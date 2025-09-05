# Script de configuration automatique Intune

Write-Output "Initialisation configuration Intune..."

# Activer Microsoft Defender Antivirus
Set-MpPreference -DisableRealtimeMonitoring $false

# Configurer BitLocker (si TPM présent)
Enable-BitLocker -MountPoint "C:" -EncryptionMethod XtsAes256 -UsedSpaceOnly -TpmProtector

# Définir la page d’accueil dans Edge
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Edge" -Name "HomepageLocation" -Value "https://intranet.corp"

Write-Output "Configuration terminée."
