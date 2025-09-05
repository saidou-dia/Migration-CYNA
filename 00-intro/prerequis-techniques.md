# Prérequis Techniques – Projet CYNA

Ce document liste les prérequis techniques nécessaires à la mise en œuvre complète du projet de migration et de sécurisation de l’infrastructure IT de la société Cyna.

---

## Infrastructure On-Premise

- Serveurs physiques ou virtualisés pour Active Directory, DNS, DHCP.
- Routeurs et switches managés (Cisco, HP, etc.).
- Firewalls (Fortinet, Palo Alto) avec support VPN/IPsec.
- Système de sauvegarde compatible Veeam.
- Hyperviseur VMware ESXi ou équivalent.

---

##  Plateforme Cloud – Microsoft Azure

- Abonnement Azure actif (niveau entreprise recommandé).
- Azure AD Premium P1 ou P2 pour la gestion des identités.
- Azure Backup, Azure Monitor, Log Analytics activés.
- Ressources réseau : VNet, Subnets, VPN Gateway, Azure Firewall.
- Azure AD Connect avec serveur hybride pour synchronisation.

---

## Sécurité et Gestion des Identités

- Microsoft Entra ID (Azure AD) avec Conditional Access.
- Authentification Multi-Facteur (Azure MFA activé).
- Active Directory Domain Services (AD DS) avec redondance.
- Certificats SSL/TLS signés par une autorité de confiance.
- AD CS pour certificats internes.
- Solution EDR/XDR (CrowdStrike, SentinelOne, etc.).

---

## Gestion des Terminaux

- Microsoft Intune pour MDM/MAM.
- Groupes dynamiques configurés (Windows, mobiles).
- Profils de conformité créés.
- Intégration des scripts PowerShell de configuration.
- Intégration Jamf pour les terminaux Apple.

---

## CI/CD et Automation

- Git installé sur les postes de développement.
- Terraform CLI v1.6+ et accès Azure CLI.
- Ansible 2.14+ pour l’automatisation des déploiements.
- Helm, Kubectl pour les environnements Kubernetes.
- Plateforme GitLab/GitHub ou Jenkins fonctionnelle.

---

## Sauvegarde & PRA

- Veeam Backup & Replication installé sur site.
- Vault Azure Backup configuré.
- Scripts de test de restauration validés.
- Plans PCA/PRA documentés avec RPO/RTO définis.

---

## Supervision

- Prometheus & Grafana installés ou déployés via Helm.
- Azure Monitor + alertes activées.
- Journalisation des accès AD / Azure AD.
- Surveillance VPN/IPSec activée.

---

## Connectivité Inter-Sites

- Connexions VPN S2S entre Paris, Genève et Azure.
- Redondance des liens critiques.
- DNS interne configuré pour résolution inter-site.
- BGP configuré si nécessaire.

---

## Environnements

- Environnements DEV, STAGING, PROD isolés et nommés.
- Reproductibilité assurée via Terraform/Ansible.
- Identifiants de test générés pour les scripts d’authentification et les MFA.

---

## Références internes

- Voir `02-infra/network_connectivity.md`
- Voir `03-security/intune_policies/`
- Voir `04-devops/01-terraform/`
- Voir `05-backup/`, `07-pra-pca/`

---

