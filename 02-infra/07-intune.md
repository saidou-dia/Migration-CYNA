# Plan d’implémentation Intune

## Objectifs
- Gérer les postes Windows 10/11 via Intune
- Appliquer des politiques de conformité
- Déployer des configurations et scripts automatiquement

## Étapes clés

### 1. Groupes dynamiques
- **Groupe Windows 10 Users**  
  - Rule: `device.deviceOSType -eq "Windows" and device.deviceOSVersion -contains "10"`
- **Groupe Windows 11 Devices**  
  - Rule: `device.deviceOSType -eq "Windows" and device.deviceOSVersion -contains "11"`

### 2. Politiques de conformité
- Mot de passe requis
- Chiffrement BitLocker activé
- Antivirus à jour
- Pas de jailbreak/root

### 3. Profils de configuration
- Déploiement des paramètres Wi-Fi, VPN, certifs
- Configuration de Defender AV
- Restriction d’accès aux périphériques USB

### 4. Déploiement de scripts
- Scripts PowerShell pour onboarding Defender ATP
- Configuration automatique d’Outlook

### 5. Reporting
- Suivi via Endpoint reporting
- Connecteur Intune <-> Log Analytics
