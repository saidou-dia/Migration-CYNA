# Active Directory – Implémentation pour la société Cyna

La société **Cyna** a choisi **Microsoft Active Directory (AD)** comme pilier central de son système d'information,
pour sa gestion unifiée des identités, haute disponibilité, sécurité renforcée et capacité d’évolution.

## Fonctionnalités principales

- **Gestion centralisée des droits et accès**
  - Group Policies (GPO) selon les rôles.
  - ACL et permissions NTFS.

- **Authentification centralisée & SSO**
  - Intégration avec Okta, Ping Identity, OneLogin.
  - Authentification unique (SSO).

- **Gestion des certificats**
  - AD CS pour Wi-Fi, VPN et communications chiffrées.
  - Déploiement automatique via GPOs.

- **Sécurité renforcée**
  - EDR/XDR : CrowdStrike Falcon, SentinelOne.
  - Réaction automatique aux comportements anormaux.

- **Protection des données**
  - DLP (Microsoft Purview) pour surveiller les accès sensibles.

## Résilience & Haute disponibilité

- Contrôleurs de domaine redondants (local + Azure).
- Réplication multi-sites sécurisée.

## Technologies complémentaires

| Composant            | Rôle                                  |
|----------------------|----------------------------------------|
| Azure AD Connect     | Synchronisation AD local ↔ Azure AD    |
| AD CS                | Gestion des certificats                 |
| CrowdStrike, SentinelOne | Sécurité EDR/XDR                  |
| Okta / OneLogin      | SSO et gestion d'identité              |
| Microsoft Purview DLP | Protection contre la fuite de données |