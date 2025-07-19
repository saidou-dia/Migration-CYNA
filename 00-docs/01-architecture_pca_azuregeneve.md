# PCA Azure Genève (Site de Production)

## Réseau Virtuel Principal (VNet Hub PCA Genève)
- **Adresse VNet** : 10.30.0.0/16

### Subnets et Services

| Subnet                      | CIDR           | Description / Services                                  |
|-----------------------------|----------------|--------------------------------------------------------|
| MonitoringSubnet            | 10.30.100.0/24 | Prometheus, Grafana, Alertmanager, Zscaler Tunnel GW  |
| GRE/IPSec to ZIA            | 10.30.251.0/28 | Tunnel GRE/IPSec vers Zscaler Internet Access (ZIA)    |
| DNS ResolverSubnet          | 10.30.252.0/27 | Azure DNS Resolver                                     |
| AzureFirewallSubnet         | 10.30.253.0/26 | Filtrage HTTP/HTTPS via Azure Firewall                 |
| AzureBastionSubnet          | 10.30.254.0/27 | Azure Bastion (accès sécurisé à VMs)                   |
| GatewaySubnet               | 10.30.255.0/27 | VPN Gateway (P2S et S2S, IPSec/OpenVPN)                |

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

## Monitoring & Logs
- Export / Push vers Azure Monitor + Log Analytics
- VM logs & metrics
- Container metrics (AKS)
- Azure Alerts
- SOC CYNA (Splunk) accessible via VPN sécurisé et internet
- Réplication logs et alertes vers SIEM local et cloud selon politique

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



