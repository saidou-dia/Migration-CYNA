# Architecture Globale

## Origine - Destination - Type de lien - Raison / Service

| Origine       | Destination    | Type de lien       | Raison / Service                   |
|---------------|----------------|--------------------|----------------------------------|
| Filiale_Paris | Siège_Genève   | VPN Site-to-Site   | Connexion centrale (AD, infra)   |
| Filiale_Paris | Azure_Genève   | VPN Site-to-Site   | Accès cloud principal pour users |
| Filiale_Paris | Azure_Paris    | Standby VPN        | Bascule PRA                      |
| Siège_Genève  | Azure_Genève   | VPN Site-to-Site   | PCA principal                    |
| Siège_Genève  | Azure_Paris    | VPN Site-to-Site   | PRA                             |
| Azure_Genève  | Azure_Paris    | Global Peering     | Réplication / haute dispo        |
