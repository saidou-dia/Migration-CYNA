# Architecture PRA Azure Paris (Azure France Central)

## VNet Principal (vnet-pra-paris)
- **Adresse VNet** : 10.40.0.0/16

### Subnets et Services

| Subnet                | CIDR           | Description / Services                                  |
|-----------------------|----------------|--------------------------------------------------------|
| Subnet-PRA-AD         | 10.40.10.0/24  | Active Directory : Domain Controllers, AD CS, AD FS, DHCP, DNS |
| Subnet-SIEM-EDR/XDR   | 10.40.40.0/24  | Logs, alertes                                          |
| Subnet-VirtualInfra   | 10.40.30.0/24  | VM, Agents Azure Arc, serveurs                         |
| Subnet-DevOps-SaaS    | 10.40.60.0/24  | Services DevOps et SaaS                                |
| Subnet-PRA-Users      | 10.40.61.0/24  | Postes utilisateurs                                    |
| Subnet-PRA-FileSync   | 10.40.20.0/24  | Azure File Sync                                        |
| Subnet-Backup         | 10.40.11.0/24  | Backup, Veeam, Azure Backup Vault                      |
| Subnet-ASR-RecoveryVM | 10.40.50.0/24  | Machines virtuelles Azure Site Recovery (ASR)         |

---

## Hub Réseau PRA Paris (vnet-hub-paris)
- **Adresse VNet** : 10.50.0.0/16

| Subnet              | CIDR             | Description / Services                   |
|---------------------|------------------|----------------------------------------|
| AzureFirewallSubnet  | 10.50.253.0/26   | Azure Firewall                         |
| AzureBastionSubnet   | 10.50.254.0/27   | Azure Bastion (accès sécurisé VMs)    |
| GatewaySubnet        | 10.50.255.0/27   | VPN Gateway (Site-to-Site, Point-to-Site) |

---

## VPN Connections liées à Azure_Paris (PRA)

| Origine       | Destination       | Type de lien      | Raison / Service          |
|---------------|-------------------|-------------------|--------------------------|
| Filiale_Paris | Azure_Paris (PRA) | Standby VPN       | Bascule PRA              |
| Siège_Genève  | Azure_Paris       | VPN Site-to-Site  | PRA                      |
| Azure_Genève  | Azure_Paris       | Global Peering    | Réplication / haute dispo|

---
