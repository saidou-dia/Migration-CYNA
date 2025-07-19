# 03. Architecture réseau de la filiale Paris
1. Fournisseurs d’accès Internet (FAI)
FAI principal : Orange – Fibre optique
FAI secondaire (backup WAN) : Bouygues – 4G/5G

2. Infrastructure SD-WAN & Sécurité
Routeur SD-WAN principal : FortiGate 60F

VPN actif vers Genève (siège) et Azure

Routeur SD-WAN secondaire (failover automatique) : FortiGate 60F

3. Commutation réseau (Access Layer)
Switch Access A1 (HA Stack) : 16 ports PoE

Fonctions : VLANs, QoS, SNMP, LACP, Redondance

Switch Access A2 (HA Stack) : 16 ports PoE

Identique au switch A1 (Stack redondant)

4. Haute disponibilité électrique
UPS / Onduleur : APC by Schneider Electric

Fournit une alimentation critique pour tous les équipements essentiels

5. Segmentation réseau (VLANs)
   
| VLAN ID | Usage             | Description               |
| ------- | ----------------- | ------------------------- |
| VLAN 10 | Postes de travail | PC utilisateurs           |
| VLAN 20 | Wi-Fi employés    | AP #1, AP #2 – SSID privé |
| VLAN 30 | Wi-Fi invités     | AP #3 – SSID public       |
| VLAN 40 | Imprimantes       | Réseau dédié aux prints   |

