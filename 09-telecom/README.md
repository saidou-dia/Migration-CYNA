# 09-telecom – UCaaS & Télécommunications d’entreprise

Ce dossier contient les configurations, scripts et paramètres liés à l'intégration des **services de communication unifiée** (UCaaS) utilisés pour la téléphonie IP, les réunions virtuelles, la messagerie instantanée, et la collaboration inter-équipes.

## Solutions UCaaS intégrées

| Solution             | Usage principal                            | Intégration      |
|----------------------|--------------------------------------------|------------------|
| Microsoft Teams      | VoIP, appels internes/externes, SSO M365   | Azure AD, Intune |
| Zoom                 | Réunions vidéo, webinaires                 | SSO, M365        |
| Cisco Webex          | Réunions, téléphonie cloud                 | M365, Outlook    |
| RingCentral          | VoIP, messages texte, fax cloud            | Salesforce, CRM  |
| Slack                | Messagerie instantanée et DevOps           | GitHub, Azure    |
| FreePBX              | PBX VoIP open source avec SIP Trunks       | SIP/SIP-TLS      |

## Arborescence

- `config/teams_config.yml` : Politique de réunion Teams, MFA, routage d’appels.
- `config/zoom_config.yml` : SSO, passcodes, enregistrement auto, sécurité.
- `config/ringcentral_config.yml` : Routage intelligent, file d’attente, analyse appels.
- `config/sip_trunks/` : Configuration des trunks SIP selon les pays (France/Suisse).
- `config/freepbx_config.yml` : Plan de numérotation local, extension, IVR.

##  Sécurité et Conformité

- Authentification centralisée via **Azure AD** ou **SSO SAML**.
- Journaux d’audit activés pour les connexions et modifications.
- DLP intégré aux échanges collaboratifs (Teams, Slack).

##  Intégration M365 / Azure

- Microsoft Teams est intégré à **Entra ID (Azure AD)**, **SharePoint**, **Exchange Online**, et **OneDrive**.
- Slack/Zoom/Webex peuvent envoyer des **alertes DevOps**, logs CI/CD, et messages automatisés via **webhooks sécurisés**.

## Supervision & Monitoring

- Monitoring VoIP via outils réseau : **Cisco Meraki**, **SolarWinds VoIP Monitor**.
- Alertes en cas de latence, gigue, ou perte de paquets (QoS).
- Dashboards Grafana intégrables via export API UCaaS.

## Objectif

Garantir une communication unifiée, hautement disponible, sécurisée et conforme RGPD, tout en assurant une **intégration fluide avec l’environnement Microsoft 365**, les workflows métiers, et les outils DevOps.

---

