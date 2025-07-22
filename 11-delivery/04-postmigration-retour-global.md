# Retour d'expérience post-migration globale CYNA

## 1. Contexte
- Présentation rapide du projet de migration et de modernisation des infrastructures CYNA.
- Objectifs principaux : sécurité renforcée, performance optimisée, homogénéisation infra Genève-Paris-Azure.

## 2. Migration physique et infrastructure on-premise
- Déménagement et redéploiement à Genève.
- Création de la filiale Paris avec équipements homogènes.
- Reprise partielle du matériel ancien.
- Mise en place des réseaux, VPN/IPSec, SD-WAN.

## 3. Migration et intégration Azure
- Bascule des applications utilisateurs vers Azure.
- Intégration hybride entre on-premise et cloud.
- Mise en place d’Azure AD, SSO et MFA.
- Gestion des workloads cloud (AKS, bases de données, etc.).

## 4. Sécurité et accès
- Implémentation EDR/XDR dans tous les sites.
- Centralisation des accès avec Azure AD.
- Mise en place progressive du MFA et du SSO.
- Surveillance via solutions de monitoring et logs centralisés.

## 5. Sauvegardes et continuité d’activité
- Mise en place PCA/PRA.
- Sauvegarde des données on-premise et cloud (Azure, Veeam).
- Plan de bascule et reprise.

## 6. Bénéfices et améliorations constatées
- Amélioration des performances réseau.
- Augmentation de la sécurité globale.
- Simplification des accès utilisateurs.
- Homogénéisation des outils et pratiques.

## 7. Points de vigilance et leçons apprises
- Limitations sans ExpressRoute (VPN uniquement).
- Performances à surveiller dans les connexions inter-sites.
- Importance du planning pour MFA/SSO.
- Gestion des données volumineuses (20 To).

## 8. Perspectives d’évolution
- Éventuelles améliorations réseau (ajout ExpressRoute).
- Automatisation accrue (Terraform, Ansible).
- Renforcement des politiques Zero Trust.

---

*Ce document synthétise le retour global de la migration et permet une vision d’ensemble pour tous les acteurs impliqués.*

