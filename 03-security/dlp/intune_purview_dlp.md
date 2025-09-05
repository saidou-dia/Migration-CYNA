# Protection DLP via Intune + Microsoft Purview

## Objectif
Empêcher les fuites de données sur les endpoints gérés par Intune.

## Politique Purview DLP
- Cibles : OneDrive, Teams, SharePoint, Exchange
- Conditions : Données sensibles (PII, données bancaires, etc.)
- Actions : Alerte, blocage, justification

## Intégration Intune
- Configuration dans Endpoint DLP
- Application de Device Configuration profiles
- Surveillance des copier/coller, transferts USB, impression

## Exemples
- Bloquer les transferts de fichiers vers clés USB
- Empêcher l’impression de fichiers contenant des IBANs
