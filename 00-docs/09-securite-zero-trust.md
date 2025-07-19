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

- **Solution proposée** : `Active Directory (AD)`  
- **Objectif** : Gestion centralisée des utilisateurs, groupes, périphériques et ressources du réseau.

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

- **Solution proposée** : `Veeam Backup & Replication`  
- **Objectif** : Sauvegarde régulière, réplication dans le cloud, restauration rapide en cas de sinistre.

