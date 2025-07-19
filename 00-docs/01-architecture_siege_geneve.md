# Architecture Siège Genève – Infrastructure Hybride Locale

## Connectivité et sécurité

- **FAI principal** : Telecom Swisscom SD-WAN (2 liens WAN en redondance HA)  
- **Pare-feux** : 2x FortiGate / pfSense en haute disponibilité  
- **Load Balancer externe** : HAProxy en HA  
- **Routeur Core** : Inter-VLAN routing (VLAN A et B)
  
## Connectivité VPN liée au Siège Genève

| Origine      | Destination    | Type de lien     | Raison / Service                        |
|--------------|----------------|------------------|---------------------------------------|
| Filiale_Paris| Siège_Genève   | VPN Site-to-Site | Connexion centrale (AD, infra)         |
| Siège_Genève | Azure_Genève   | VPN Site-to-Site | PCA principal                         |
| Siège_Genève | Azure_Paris    | VPN Site-to-Site | PRA                                   |

## Kubernetes

- **K8s Worker A**  
- **VLAN 45 – Environnement Dev / SaaS / DevOps**  
  Hébergement GitLab, Terraform, Ansible  
- **K8s Worker B**  
- **VLAN 44 – Applications production / backends**  

## Infrastructure réseau

- **Switch distribution A & B** : 48 ports 10 Gbps chacun  
- **Accès réseau (PoE)** :  
  - Access A1 : 48 ports PoE  
  - Access A2 : 48 ports PoE  
  - Access B1 : 48 ports PoE (x2)  

## Postes utilisateurs et WiFi

- **VLAN 10 / 11 / 12** : 100 PC et 14 points d’accès WiFi  
  (utilisateurs fixes, portables et WiFi internes, gestion via AD + Intune/MDM)  

## Virtualisation / Stockage / Sauvegarde

- **Proxmox VMs et clusters** :  
  - Proxmox05 (VLAN 47) : Broker VDI + VMs VDI  
  - Proxmox03 (VLAN 42) : Sauvegardes VEEAM  
  - Proxmox04 (VLAN 30) : DMZ, Load Balancer externe, serveur VPN  
  - Proxmox06 (VLAN 46) : Bases de données SQL/Postgres, Grafana, ELK  
  - Proxmox01 (VLAN 40) : AD DC, ADCS, GPO, SSO, DHCP, DNS  
  - Proxmox02 (VLAN 41) : NAS TrueNAS  

## Sécurité et accès

- **VLAN 99** : Jumpbox / Bastion (administration, accès sécurisé RDP/SSH)  
- **VLAN 60** : WiFi invités (internet uniquement, segment isolé)  
- **VLAN 50** : Imprimantes partagées (PrintSrv)  
- **VLAN 70** : CCTV / vidéosurveillance / monitoring  

## SOC interne (VLAN 91)

Environnement sécurisé pour infrastructure critique SOC :  
Splunk, QRadar, ELK, Wazuh, SOAR, VMs analystes  
Serveurs physiques redondants  
NAS TrueNAS  

---

## Légendes VLAN

| VLAN | Description                                           |
|-------|-----------------------------------------------------|
| 10    | Utilisateurs fixes et portables (AD + Intune/MDM)  |
| 11-12 | WiFi internes pour portables (AD + Intune/MDM)      |
| 30    | DMZ / Load Balancer externe / VPN Server             |
| 40    | Infrastructure : AD DC, GPO, SSO, DHCP, DNS          |
| 41    | Stockage NAS (TrueNAS)                                |
| 42    | Sauvegardes (Veeam)                                   |
| 43    | Gestion IT interne (Prometheus, supervision)          |
| 44    | Applications internes métier (production, ERP)        |
| 45    | Dev / SaaS / GitLab / Terraform / Ansible / K8s      |
| 46    | Bases de données (SQL Server, PostgreSQL, MongoDB)    |
| 47    | Environnement de test / projets spécifiques            |
| 50    | Imprimantes partagées                                  |
| 60    | WiFi invités (Internet uniquement, segment isolé)     |
| 70    | Caméras de vidéosurveillance / monitoring CCTV         |
| 91    | SOC interne (SIEM, SOAR, analystes)                    |
| 99    | Admin / Bastion + accès sécurisés                       |

---

## Typologie des utilisateurs (exemple sur 200 personnes)

| Type d'utilisateur           | Nb approx. | Équipements                 | Observations                    |
|-----------------------------|------------|----------------------------|--------------------------------|
| Comptabilité / Finance       | 15         | PC fixe + imprimante partagée | Sédentaires, usage intensif d’applicatifs |
| Ressources Humaines          | 10         | PC portable                | Besoin de mobilité, parfois en télétravail |
| Direction Générale / Managers| 10         | PC portable + smartphone   | Itinérants, besoin de mobilité  |
| Commercial / Marketing       | 40         | PC portable + smartphone   | Déplacements fréquents, télétravail |
| Production / Opérations      | 25         | PC fixe ou terminal dédié  | Sédentaires ou en atelier       |
| Support Technique / Maintenance | 20      | PC portable + téléphone    | Itinérants ou semi-itinérants   |
| Développement / IT internes | 20         | PC fixe + portable + smartphone | Administration, supervision    |
| Utilisateurs Support / Admin | 40         | PC fixe + accès au système | Postes support / bureautique    |
| Accueil / Réception / Logistique | 10      | PC fixe ou tablette selon rôle | Accès limité ou dédié          |
