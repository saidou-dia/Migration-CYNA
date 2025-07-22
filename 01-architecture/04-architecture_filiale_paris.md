# 01. Architecture Filiale Paris

## Fournisseurs d'accès Internet (FAI)

- **FAI N°1** : Fibre optique Orange
- **FAI N°2** : Fibre optique Bouygues failover automatique (backup)

## Équipements réseau

- **Routeur SD-WAN Principal**  
  - VPN actif vers Genève + Azure  
  - Modèle : FortiGate 60F

- **Routeur SD-WAN Secondaire** (Failover automatique)  
  - Modèle : FortiGate 60F

- **Switch Access A1** (HA STACK)  
  - 16 ports PoE  
  - Support VLANs, QoS, SNMP, LACP/Redondance  
  - Modèle : FortiGate 40F

- **Switch Access A2** (HA STACK)  
  - 16 ports PoE  
  - Support VLANs, QoS, SNMP, LACP/Redondance  
  - Modèle : FortiGate 40F

- **Onduleur / UPS**  
  - APC by Schneider Electric  
  - Alimentation critique  

## Réseau LAN et VLANs

| VLAN  | Usage                      | Description                          |
|-------|----------------------------|------------------------------------|
| 10    | Postes PC                  | 6 employés sédentaires              |
| 20    | Wi-Fi Employés             | 9 commerciaux itinérants, SSID AP #1 & #2 |
| 30    | Wi-Fi Invités              | SSID AP #3                         |
| 40    | Imprimantes partagées      | Imprimantes en réseau               |
| 50    | Wi-Fi Invités (Internet uniquement, isolé) | Réseau isolé pour invités avec accès Internet uniquement |


## Connectivité VPN liée à la Filiale Paris

| Origine       | Destination        | Type de lien       | Raison / Service                      |
|---------------|--------------------|--------------------|-------------------------------------|
| Filiale_Paris | Siège_Genève       | VPN Site-to-Site   | Connexion centrale (AD, infra)      |
| Filiale_Paris | Azure_Genève (PCA) | VPN Site-to-Site   | Accès cloud principal pour users    |
| Filiale_Paris | Azure_Paris (PRA)  | Standby VPN        | Bascule PRA                        |



