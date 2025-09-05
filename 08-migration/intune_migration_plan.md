# Plan de migration GPO/SSC vers Intune

## Étapes de transition

### 1. Inventaire des GPO existantes
- Export des GPO via `Get-GPOReport`
- Classification : sécurité, configuration, restrictions

### 2. Mapping vers Intune
| GPO                             | Équivalent Intune                           |
|--------------------------------|---------------------------------------------|
| Password Policy                | Compliance policy                           |
| BitLocker Policy               | Device Configuration Profile                |
| Firewall / Defender Settings   | Endpoint Protection                         |
| USB Blocking                   | Custom OMA-URI or CSP policy                |

### 3. Test pilote
- 10 utilisateurs en mode hybride co-management
- Comparaison des effets GPO vs Intune

### 4. Passage complet
- Bascule des devices en mode "MDM only"
- Désactivation progressive des GPOs
