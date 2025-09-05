# Infrastructure Cible – Projet Cyna

## Objectif

Définir l’architecture cible post-migration pour la société Cyna, incluant :
- Le **siège principal à Genève**
- La **filiale à Paris**
- Une **infrastructure cloud hybride** (Microsoft Azure)
- Des **connexions VPN sécurisées** entre les sites

---

## 1. Vue Globale de l’Infrastructure
<img width="921" height="567" alt="infracible_azure_paris_geneve" src="https://github.com/user-attachments/assets/572e006d-48e3-4241-9904-2cccbd487db6" />

                   +------------------+
                   | Microsoft Azure  |
                   +------------------+
                        /        \
                       /          \
                      /            \
           +----------------+   +----------------+
           | Azure Genève   |   | Azure Paris    |
           | (Landing Zone) |   | (Landing Zone) |
           +----------------+   +----------------+
                 |                      |
                 |  VPN IPSec           | VPN IPSec
                 |                      |
      +-------------------+     +---------------------+
      | Siège – Genève    |     | Filiale – Paris     |
      | (Datacenter local)|     | (Site secondaire)   |
      +-------------------+     +---------------------+
                 \__________________/
                    VPN site-à-site sécurisé

                    
---

## 2. Composants principaux

### 🔹 Azure (Cloud public – Microsoft)

- **Landing Zones Genève et Paris** :
  - Azure AD (via Entra ID) synchronisé
  - VM pour services SaaS internes
  - Stockage (Blob / File Share)
  - Sauvegardes Azure Backup / Recovery Vault
  - Sécurité intégrée : Defender for Endpoint, Azure Firewall, NSG
  - Supervision centralisée : Sentinel, Log Analytics

### 🔹 Siège – Genève (Infrastructure locale)

- Serveurs physiques Proxmox (VDI, AD, DNS, etc.)
- Pare-feux FortiGate
- Switches cœur + distribution
- Onduleurs (UPS) + climatisation dédiée
- Tunnel VPN IPSec vers Azure et Paris
- Services critiques centralisés

### 🔹 Filiale – Paris

- Pas de datacenter local lourd
- Postes utilisateurs + imprimantes partagées
- Connexion VPN IPSec vers Azure Paris et Genève
- Accès VDI sécurisé + applications SaaS
- Conformité aux spécificités légales locales

---

## 3. Principes d’architecture

- 🔐 **Sécurité Zero Trust** : MFA, accès conditionnel, segmentation réseau
- 🔄 **Disponibilité** : VDI redondé entre Proxmox et Azure
- 🌐 **Uniformité** : stack logicielle homogène (M365, Intune, Defender)
- 🛡️ **Cybersécurité** : SOC + EDR/XDR sur tous les postes
- 🧠 **Supervision centralisée** : Sentinel, Nexthink, Zabbix

---

## 4. Objectifs clés

- Centraliser les services critiques à Genève
- Offrir un accès sécurisé aux utilisateurs de Paris
- Garantir la mobilité, la résilience et la scalabilité
- Faciliter le support et la supervision multi-sites

---

## 5. À faire / Prochaines étapes

- [ ] Finaliser les tunnels VPN site-à-site (Azure ↔ Genève ↔ Paris)
- [ ] Valider les stratégies Intune et politique EDR
- [ ] Tester la haute disponibilité VDI et redondance
- [ ] Mettre en place les dashboards de supervision (Nexthink, Sentinel)

