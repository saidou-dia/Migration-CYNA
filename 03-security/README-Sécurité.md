# Sécurité – Synthèse des Solutions Proposées

Ce document présente les solutions recommandées pour répondre aux exigences de sécurité exprimées dans le cahier des charges, selon les thématiques clés.

## Architecture Zero Trust

- **Solution proposée** : `Zscaler Zero Trust Exchange`  
- **Objectif** : Vérification continue des utilisateurs et des appareils, segmentation dynamique, et accès basé sur les rôles.

## EDR / XDR

- **Solution proposée** : `CrowdStrike Falcon`  
- **Objectif** : Surveillance en temps réel, détection des comportements anormaux, réponse rapide aux menaces.

## SIEM

- **Solution proposée** : `Splunk Enterprise Security`  
- **Objectif** : Centralisation des logs, corrélation des événements de sécurité, détection proactive des incidents.

## VPN & Accès Distants

- **Solution proposée** : `Palo Alto GlobalProtect`  
- **Objectif** : Connexion sécurisée sans dépendre de périmètres réseau fixes, avec des politiques d'accès dynamiques.

## Authentification Multi-Facteurs (MFA)

- **Solution proposée** : `Microsoft Azure MFA`  
- **Objectif** : Sécurisation des accès aux ressources critiques via une vérification à deux facteurs.

## Réponse automatisée aux incidents (SOAR)

- **Solution proposée** : `Splunk Phantom`  
- **Objectif** : Orchestration de la réponse aux incidents, automatisation des blocages et notifications.

## Authentification Unique (SSO)

- **Solution proposée** : `Okta`  
- **Objectif** : Simplification de l'accès aux applications avec une authentification unique et sécurisée.

## Service d’annuaire

- **Solution proposée** : `Synchronisation Active Directory / Azure`  
- **Objectif** : Gestion centralisée des utilisateurs, groupes, périphériques et ressources du réseau.

-Solution proposée : Microsoft Entra Connect (Azure AD Connect)
-Synchronisation des identités entre Active Directory on-premises et Azure AD
-Maintien d’un annuaire hybride cohérent pour les scénarios cloud-first et hybrides
-Support de la synchronisation des mots de passe, des objets, et du SSO hybride
-Point d’ancrage pour les stratégies de sécurité cloud comme Conditional Access, MFA, et DLP

[ Utilisateurs ] 
      ↓
[ Active Directory On-Prem ]
      ↓
[ Microsoft Entra Connect (Azure AD Connect) ]
      ↓
[ Microsoft Entra ID (Azure AD) ]
      ↓         ↓             ↓
 [SSO]     [MFA]     [DLP / Conditional Access]



## Gestion des droits utilisateurs

- **Solution proposée** : `Group Policies (GPO)`  
- **Objectif** : Attribution fine des autorisations selon les rôles dans l’organisation.

## Gestion des certificats

- **Solution proposée** : `Active Directory Certificate Services (AD CS)`  
- **Objectif** : Délivrance et gestion des certificats pour sécuriser le Wi-Fi, VPN, et les communications internes.

## Protection contre la fuite de données (DLP)

- **Solution proposée** : `Microsoft Purview DLP`  
- **Objectif** : Surveillance des fichiers sensibles et prévention des exfiltrations de données.

## Sauvegarde & PRA/PCA

- **Solutions proposées** :
  - `Veeam Backup & Replication`
  - `Azure Backup`

- **Objectif** :
  - Sauvegarde régulière des machines virtuelles, bases de données et configurations critiques
  - Réplication inter-région entre Azure Paris (PCA) et Azure Genève (PRA)
  - Restauration rapide en cas de sinistre, cyberattaque ou défaillance matérielle
  - Intégration avec la stratégie Zero Trust via segmentation réseau des flux de restauration
  - Gestion centralisée des politiques de rétention et de conformité

- **Automatisation** :
  - Déclenchement de scénarios de bascule via scripts (`06-pca-pra/recovery_scripts/`)
  - Surveillance de l’état des sauvegardes via Prometheus + alertes Grafana
  - Azure Monitor` avec alertes sur les coffres Recovery Services et les jobs de sauvegarde
