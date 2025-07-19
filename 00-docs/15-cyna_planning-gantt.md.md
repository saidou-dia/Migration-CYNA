# Planning Projet IT - Migration & Infra Cloud

## Phase 1 – Préparation & Cadrage

| Tâche principale                         | Sous-tâches                                         | Responsable     | Échéance         |
|-----------------------------------------|----------------------------------------------------|-----------------|------------------|
| Audit IT matériel & logiciel Paris       | - Inventaire postes, serveurs, logiciels           | IT Paris        | 15 juillet 2025  |
|                                         | - Vérification compatibilité cloud                  | IT Paris        | 15 juillet 2025  |
| Choix du prestataire matériel (Suisse)  | - Consultation fournisseurs                         | DSI + Achats    | 31 juillet 2025  |
|                                         | - Comparatif devis et délais                         | DSI + Achats    | 31 juillet 2025  |
| Souscription Azure                       | - Création compte, tenant                           | IT Genève       | Juillet 2025     |
|                                         | - Activation licences nécessaires                    | IT Genève       | Juillet 2025     |
| Création tenant Azure + RG + VNet       | - Créer souscriptions                               | IT Genève       | Juillet 2025     |
|                                         | - Configuration des groupes de ressources (RG)     | IT Genève       | Juillet 2025     |
|                                         | - Création et configuration VNet                    | IT Genève       | Juillet 2025     |
| Mise en place Entra ID, Intune, Defender| - Déploiement MFA                                   | Sécurité        | Juillet 2025     |
|                                         | - Configuration des politiques Intune               | Sécurité        | Juillet 2025     |
|                                         | - Test de sécurité initial                           | Sécurité        | Juillet 2025     |
| Définition stratégie Terraform & Ansible| - Création des modules de base                      | Infra           | Juillet 2025     |
| Préparation module azure_paris          | - Définir RG, NSG                                   | Infra           | Juillet 2025     |
|                                         | - Configuration stockage et compute                  | Infra           | Juillet 2025     |
| Choix outils CI/CD                      | - Comparatif GitLab/Jenkins                         | DevOps          | Juillet 2025     |
| Stratégie PRA/PCA                       | - Choix régions Azure                               | Infra/Sécurité  | Juillet 2025     |
|                                         | - Définition topologie DR                            | Infra/Sécurité  | Juillet 2025     |

## Phase 2 – Infra Genève & Connexions

| Tâche principale                         | Sous-tâches                                         | Responsable     | Échéance         |
|-----------------------------------------|----------------------------------------------------|-----------------|------------------|
| Mise en place infra physique Genève     | - Installation serveurs                             | IT Genève       | Septembre 2025   |
|                                         | - Installation baie de stockage                     | IT Genève       | Septembre 2025   |
| Déploiement Azure Genève                 | - Terraform RG, VNet, NSG                           | Infra           | Août 2025        |
|                                         | - Déploiement AKS cluster                           | Infra/DevOps    | Août 2025        |
| Déploiement AKS Genève                   | - Installation Helm                                 | DevOps          | Août 2025        |
|                                         | - Configuration ingress controller                   | DevOps          | Août 2025        |
| Connexion sécurisée Paris ↔ Azure        | - Configuration VPN ou SD-WAN                        | Réseau          | Début août 2025  |
| Monitoring Prometheus                    | - Déploiement Prometheus                            | DevOps          | Août 2025        |
|                                         | - Installation Node Exporter                         | DevOps          | Août 2025        |
| Sauvegarde Paris vers Azure              | - Configuration OneDrive/SharePoint                 | CloudOps        | Août 2025        |
|                                         | - Configuration sauvegarde fichiers serveurs        | CloudOps        | Août 2025        |
| Connexion Azure ↔ Genève                 | - Configuration VPN IPsec ou Azure vWAN             | Réseau          | Fin août 2025    |
| Tests PRA                              | - Simulation coupure                                | IT Genève       | Septembre 2025   |
|                                         | - Test de restauration                              | IT Genève       | Septembre 2025   |
| Connexion intersites Genève ↔ Paris     | - Peering ou VPN direct                              | Réseau          | Septembre 2025   |
| Tests latence et redondance              | - Tests ICMP                                        | Sécurité        | Septembre 2025   |
|                                         | - Tests sécurité Zscaler                            | Sécurité        | Septembre 2025   |

## Phase 3 – Migration & Mise en Service

| Tâche principale                         | Sous-tâches                                         | Responsable     | Échéance         |
|-----------------------------------------|----------------------------------------------------|-----------------|------------------|
| Migration utilisateurs Paris → Genève   | - Inventaire données utilisateurs                   | IT Paris/Genève | Octobre 2025     |
|                                         | - Migration OneDrive/SharePoint                      | IT Paris/Genève | Octobre 2025     |
|                                         | - Transfert profils utilisateurs                      | IT Paris/Genève | Octobre 2025     |
|                                         | - Validation post-migration                           | IT Paris/Genève | Octobre 2025     |
| Création filiale Paris via azure_paris  | - Terraform déploiement                              | Infra/CloudOps  | Octobre 2025     |
|                                         | - Configuration réseau Paris                          | Infra/CloudOps  | Octobre 2025     |
| Reconfiguration filtrage local Paris    | - Configuration Zscaler                              | IT Paris        | Octobre 2025     |
|                                         | - Mise à jour DNS et règles NSG                      | IT Paris        | Octobre 2025     |
| Déploiement AKS Paris                    | - Déploiement cluster                                | DevOps          | Octobre 2025     |
|                                         | - Déploiement services applicatifs                   | DevOps          | Octobre 2025     |
| Lancement pipelines CI/CD                | - Configuration pipelines GitLab                      | DevOps          | Octobre 2025     |
|                                         | - Déploiement automatique                            | DevOps          | Octobre 2025     |
| Monitoring Paris                        | - Création dashboards Grafana                        | DevOps          | Novembre 2025    |
|                                         | - Mise en place alerting                              | DevOps          | Novembre 2025    |
| Mise en service du site Genève           | - Basculer accès utilisateurs                         | IT Genève       | 3 novembre 2025  |
|                                         | - Validation finale                                  | IT Genève       | 3 novembre 2025  |

## Phase 3 bis – Validation Hybride

| Tâche principale                         | Sous-tâches                                         | Responsable     | Échéance         |
|-----------------------------------------|----------------------------------------------------|-----------------|------------------|
| Finalisation connexions sécurisées       | - Validation tunnel complet                          | Réseau          | Novembre 2025    |
|                                         | - Validation split tunnel                            | Réseau          | Novembre 2025    |
| Tests accès services critiques           | - Test messagerie                                   | IT + Business   | Novembre 2025    |
|                                         | - Test CRM et autres SaaS                            | IT + Business   | Novembre 2025    |
| Validation filtrage + accès              | - Vérification politiques Zscaler                    | Sécurité        | Novembre 2025    |
|                                         | - Validation MFA et RBAC                             | Sécurité        | Novembre 2025    |
| Rôles IT validés                        | - Définition gestion des responsabilités             | DSI + RH        | Novembre 2025    |
| Validation PRA/PCA hybride               | - Tests finaux PRA/PCA                               | DSI + SecOps    | Novembre 2025    |
|                                         | - Acceptation finale                                | DSI + SecOps    | Novembre 2025    |

## Phase 4 – Clôture & Désengagement

| Tâche principale                         | Sous-tâches                                         | Responsable     | Échéance         |
|-----------------------------------------|----------------------------------------------------|-----------------|------------------|
| Fermeture zones Paris non utilisées      | - Déconnexion équipements                           | IT Paris        | Novembre 2025    |
|                                         | - Inventaire matériel retiré                         | IT Paris        | Novembre 2025    |
| Démontage, résiliation, libération locaux| - Clôture contrats                                  | Logistique      | 1er décembre 2025|
|                                         | - Retrait matériel                                  | Logistique      | 1er décembre 2025|
| Archivage config Terraform & Ansible    | - Push final dans Git                               | Infra/CloudOps  | Décembre 2025    |
|                                         | - Tagging des versions                              | Infra/CloudOps  | Décembre 2025    |
| Livraison documentation finale           | - Consolidation documentation projet                 | DSI             | Décembre 2025    |
|                                         | - Consolidation documentation sécurité                | DSI             | Décembre 2025    |
