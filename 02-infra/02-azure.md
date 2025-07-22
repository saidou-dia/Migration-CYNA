# Azure – Vue d’ensemble de l’environnement Cloud

Ce document présente l’infrastructure déployée dans Microsoft Azure dans le cadre du projet de migration IT de la filiale Paris vers Genève. Il détaille la stratégie hybride entre les environnements on-premise et cloud public.

---

## Objectifs Azure

- Moderniser l'infrastructure IT en s’appuyant sur des services managés.
- Garantir une haute disponibilité (HA) et une reprise après sinistre (PRA).
- Appliquer les politiques de sécurité basées sur le modèle Zero Trust.
- Réduire la dépendance à l’infrastructure locale (on-premise).

---

## Composants déployés dans Azure

| Composant Azure            | Description                                                                 |
|---------------------------|-----------------------------------------------------------------------------|
| Azure Virtual Network      | Réseau principal connecté aux filiales Paris et Genève via VPN Gateway.     |
| Azure Bastion             | Accès sécurisé aux machines virtuelles sans exposition directe des ports RDP/SSH. |
| Azure Kubernetes Service (AKS) | Hébergement des applications conteneurisées et microservices.           |
| Azure Active Directory     | Gestion centralisée des identités et authentification, synchronisation via Azure AD Connect. |
| Azure Key Vault            | Stockage sécurisé des clés, certificats et secrets.                         |
| Azure Monitor              | Supervision, alertes, collecte et analyse des logs applicatifs et systèmes. |
| Azure Backup               | Sauvegarde des machines virtuelles et des données critiques.                |
| Log Analytics              | Analyse centralisée des journaux de l’environnement hybride.                |
| Application Gateway / WAF  | Sécurisation et équilibrage du trafic web applicatif.                       |

---

## Sécurité et conformité

- Intégration avec Zscaler pour la sécurité réseau.
- Authentification multifactorielle (MFA) obligatoire via Azure AD Conditional Access.
- Application des politiques de conformité à l’aide d’Azure Policy.
- Mise en œuvre de la protection des données (DLP), chiffrement au repos et en transit.

---

## Intégration hybride avec le on-premise

- Configuration d’un Azure VPN Gateway en connexion site-à-site (S2S) avec le firewall de Genève.
- Synchronisation des identités locales avec Azure Active Directory via Azure AD Connect.
- Peering réseau entre les Virtual Networks régionaux pour garantir la haute disponibilité et les procédures PRA.

---

## Références croisées

- Voir `05-terraform.md` pour les scripts d’automatisation et provisioning Azure.
- Voir `09-securite-zero-trust.md` pour les détails des politiques de sécurité.
- Voir `10-pca-pra.md` pour la stratégie de continuité d’activité et reprise.

---

## Conclusion

Azure constitue le socle cloud sécurisé, évolutif et automatisé du projet, en cohérence avec les objectifs de transformation digitale du groupe. Son intégration avec l’infrastructure locale permet une migration progressive et maîtrisée.
