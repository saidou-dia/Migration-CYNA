# 01. PCA Azure Genève (Site de Production)

## Réseau Virtuel Principal (VNet Hub PCA Genève)
- **Adresse VNet** : 10.30.0.0/16

### Subnets et Services

| Subnet                  | CIDR           | Services / Rôles                                                                                  |
|-------------------------|----------------|--------------------------------------------------------------------------------------------------|
| subnet-lb-app-geneve    | 10.10.10.0/24  | Azure Application Gateway (WAF, SSL), accès public : plateforme.shop.cyna.com                     |
| subnet-dmz-geneve       | 10.10.20.0/24  | K8s Shop Front (Web), K8s SaaS Front, 4 VMs (16 Go, 4 vCPU), Prometheus                           |
| subnet-app-geneve       | 10.10.30.0/24  | API SaaS / Shop, Services internes métier, Prometheus                                             |
| subnet-db-geneve        | 10.10.40.0/24  | Bases de données PostgreSQL / MySQL / Oracle, Serveurs comptabilité / trésorerie                  |
| subnet-DevOps-Geneve    | 10.10.50.0/24  | Services DevOps internes, développement SaaS                                                     |
| subnet-users-geneve     | 10.10.60.0/24  | Postes utilisateurs, accès distants sécurisés (P2S/S2S/MFA)                                      |
| subnet-admin-geneve     | 10.10.70.0/24  | Active Directory DS, GPO, SSO, IaC                                                              |
| subnet-security-geneve  | 10.10.80.0/24  | EDR/XDR Microsoft Defender, Firewalls virtuels, SIEM (Splunk), ZTNA, MFA                         |


---

## Réseau Production Principal (VNet-PCA-Azure-Geneve)
- **Adresse VNet** : 10.20.0.0/16
- Utilisation : Réseau principal pour le PCA (Plan de Continuité d’Activité) Azure Genève, incluant réplication applicative, bases de données et sauvegardes.

### SOC - SIEM local (Splunk)
- Logs centralisés  
- Gestion des alertes & incidents  
- Sécurité : XDR, Firewall  

### Active Directory
- Domain Controllers  
- AD CS  
- DHCP  
- DNS  
- AD FS  

### Réseau & Postes
- Équipements virtuels  
- DevOps & SaaS Dev (subnet 10.10.50.0/24)  
- SOC accès sécurisé  

### Stockage & Sauvegarde
- Azure File Sync (NAS)  
- Azure Blob Storage (Backup)  
- Veeam + Azure Site Recovery (ASR)  

### Virtualisation
- Azure Arc pour VM  

---

## Réseau Application - Production (vnet-prod-azure-geneve)
- CIDR : 10.10.0.0/16

| Subnet                   | CIDR           | Services / Rôle                                            |
|--------------------------|----------------|------------------------------------------------------------|
| subnet-lb-app-geneve     | 10.10.10.0/24  | Azure Application Gateway (WAF + SSL)                      |
| subnet-dmz-geneve        | 10.10.20.0/24  | Kubernetes SaaS Front (Web) et Shop Front, K8s Cluster SaaS |
| subnet-app-geneve        | 10.10.30.0/24  | API SaaS / Shop – Logiciels, Services métier internes      |
| subnet-db-geneve         | 10.10.40.0/24  | Bases de données : PostgreSQL / MySQL / Oracle, Serveurs comptables et trésorerie (IaaS & PaaS) |
| subnet-users-geneve      | 10.10.60.0/24  | Postes utilisateurs (Intune, MDM)                          |
| subnet-admin-geneve      | 10.10.70.0/24  | Administration (AD DS, GPO, AD CS, SSO, IaC)               |
| subnet-security-geneve   | 10.10.80.0/24  | Sécurité : EDR/XDR Microsoft Defender, firewalls virtuels, Zero Trust, MFA, Conditional Access |

---

### subnet-dmz-geneve (10.10.20.0/24)
- Kubernetes Clusters (SaaS + Shop) :
  - K8s SaaS Front (Web) – Web frontend SaaS
  - K8s Shop Front (Web) – Web frontend Shop
- Cluster Prometheus :
  - 4 VMs (16 Go RAM / 4 vCPU chacune)
  - +2 Pods autoscaling
  - Prometheus pour supervision applicative
- Type de services :
  - IaaS (VMs Prometheus)
  - PaaS (Kubernetes)
  - SaaS (Apps front-end)

---

### subnet-db-geneve (10.10.40.0/24)
- Bases de données métiers :
  - PostgreSQL
  - MySQL
  - Oracle
- Serveurs critiques :
  - Serveur Comptable (IaaS)
    - Données système, logs, transactions financières
  - Serveur Trésorerie (PaaS)
    - Gestion de trésorerie, sécurité des flux
- Monitoring :
  - Prometheus pour surveillance BDD et IaaS
- Sécurité :
  - Serveurs EDR/XDR :
    - Vendor : CrowdStrike Falcon ou SentinelOne
    - Spécifications :
      - 128 Go RAM
      - 16 cœurs CPU
      - 2 To de stockage

- Type de services :
  - IaaS (serveurs BDD & comptables)
  - PaaS (trésorerie)
  - EDR/XDR (sécurité)

---

### Synthèse des services par sous-réseau

| Sous-Réseau           | Adresse CIDR     | Rôles principaux                          | Types de services                 |
|-----------------------|------------------|-------------------------------------------|-----------------------------------|
| subnet-dmz-geneve     | 10.10.20.0/24    | K8s SaaS/Shop Front, Prometheus cluster   | IaaS, PaaS, SaaS                  |
| subnet-db-geneve      | 10.10.40.0/24    | Bases de données, compta, trésorerie, XDR | IaaS, PaaS, Sécurité (EDR/XDR)     |

---

## Monitoring & Logs
- Export / Push vers Azure Monitor + Log Analytics
- VM logs & metrics
- Container metrics (AKS)
- Azure Alerts
- SOC CYNA (Splunk) accessible via VPN sécurisé et internet
- Réplication logs et alertes vers SIEM local et cloud selon politique

---

# Connexions VPN - Azure Genève (Site de Production PCA)

| Origine       | Destination   | Type de lien     | Raison / Service                   |
|---------------|---------------|------------------|----------------------------------|
| Filiale_Paris | Azure_Genève  | VPN Site-to-Site | Accès cloud principal pour users |
| Siège_Genève  | Azure_Genève  | VPN Site-to-Site | PCA principal                    |
| Azure_Genève  | Azure_Paris   | Global Peering   | Réplication / haute dispo        |

---

## Sécurité & Accès distants
- Microsoft Entra ID (Azure AD) pour SSO, MFA, Conditional Access, Identity PIM
- Accès distants sécurisés (VPN P2S / S2S, MFA, Zero Trust)
- Zscaler (ZIA/ZPA Client Connector)
- Intune / Autopilot pour gestion des postes utilisateurs

---

## Serveurs EDR/XDR
- Solutions : CrowdStrike Falcon ou SentinelOne  
- Performances : 128 Go RAM, 16 cœurs CPU, 2 To stockage

---

## Réplications & Sauvegardes
- Réplication App, DB et Backup via VPN Site-to-Site chiffré (exemple : Veeam, Azure Site Recovery, Oracle GoldenGate)

---

## Services Complémentaires

### Sécurité & Identité
- Microsoft Entra ID (Azure AD) :
  - SSO, MFA, Conditional Access
  - Identity Protection (PIM)
- Zscaler (ZIA / ZPA Client Connector) :
  - Zero Trust Network Access

### Messagerie & Collaboration
- Microsoft 365 (Exchange Online)
- SSO pour SaaS / internes
- Intune / Autopilot / MDM

### Infrastructure
- Azure File Sync (NAS)
- Azure Blob Storage (Backup)
- Sauvegardes : Veeam, Azure Site Recovery
- Virtualisation : Azure Arc pour les VM hybrides

### Supervision & Journalisation
- Azure Monitor + Agent Log Analytics
  - Logs VM / containers / AKS
  - Alertes Azure
- Splunk local (SOC)
  - Réplication vers SIEM Cloud selon politique
