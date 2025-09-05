# Planning Projet CYNA IT - Migration & Infrastructure Cloud

## Découpage en Phases Techniques

| Phase | Période | Objectifs |
|-------|---------|-----------|
| **Phase 1 – Préparation & Cadrage** | Juillet–mi-septembre 2025 | Audit, choix prestataire, création tenant Azure, définition technos |
| **Phase 2 – Infra Genève & Connexions** | Août–septembre 2025 | Déploiement Azure, AKS, réseau sécurisé, PRA |
| **Phase 3 – Migration & Mise en service** | Octobre–début novembre 2025 | Migration Paris → Genève, AKS Paris, CI/CD |
| **Phase 3 bis – Validation hybride** | Novembre 2025 | Tests sécurité, accès, PRA/PCA hybride |
| **Phase 4 – Clôture & Désengagement** | Décembre 2025 | Restitution Paris, documentation finale, archivage Git |

---

## Dates clés du projet

-  **Choix du prestataire** : 17 septembre 2025  
-  **Disponibilité des locaux à Genève** : 1er août 2025  
-  **Restitution des locaux de Paris** : 1er décembre 2025

---

## Planning détaillé par phase

### 🔹 Phase 1 – Préparation & Cadrage (juillet → 17 septembre 2025)

| Tâche principale | Sous-tâches | Responsable | Échéance |
|------------------|-------------|-------------|----------|
| Audit IT Paris | Inventaire matériel et logiciel | IT Paris | 15 juillet 2025 |
|  | Vérification compatibilité cloud | IT Paris | 15 juillet 2025 |
| Choix du prestataire matériel (Suisse) | Consultation fournisseurs | DSI + Achats | 17 septembre 2025 |
|  | Comparatif devis et délais | DSI + Achats | 17 septembre 2025 |
| Souscription Azure | Création compte, tenant | IT Genève | juillet 2025 |
|  | Activation licences | IT Genève | juillet 2025 |
| Création tenant Azure + VNet + RG | Structuration de l’environnement | IT Genève | juillet 2025 |
| Sécurité M365 | MFA, Intune, Defender | Sécurité | juillet 2025 |
| Stratégie Terraform/Ansible | Définition des modules | Infra | juillet 2025 |
| Définition PRA/PCA | Choix zones, topologie DR | Infra/Sécurité | juillet 2025 |

---

### 🔹 Phase 2 – Infra Genève & Connexions (août → septembre 2025)

| Tâche principale | Sous-tâches | Responsable | Échéance |
|------------------|-------------|-------------|----------|
| Mise en place infra Genève | Installation serveurs, baie | IT Genève | août 2025 (dès le 1er) |
| Déploiement Azure Genève | RG, VNet, NSG | Infra | août 2025 |
| Déploiement AKS Genève | Helm, ingress, services | DevOps | août 2025 |
| Connexion Paris ↔ Azure | VPN ou SD-WAN | Réseau | début août 2025 |
| Monitoring Prometheus | Prometheus + Node Exporter | DevOps | août 2025 |
| Sauvegarde Paris vers Azure | OneDrive/SharePoint | CloudOps | août 2025 |
| Connexion Azure ↔ Genève | VPN IPsec ou vWAN | Réseau | fin août 2025 |
| Tests PRA Genève | Simulation et restauration | IT Genève | septembre 2025 |
| Connexion Genève ↔ Paris | Peering ou VPN direct | Réseau | septembre 2025 |
| Tests sécurité | ICMP, Zscaler | Sécurité | septembre 2025 |

---

### 🔹 Phase 3 – Migration & Mise en service (octobre 2025)

| Tâche principale | Sous-tâches | Responsable | Échéance |
|------------------|-------------|-------------|----------|
| Migration utilisateurs Paris → Genève | Données, profils, validation | IT Paris/Genève | octobre 2025 |
| Création filiale Azure Paris | Déploiement via Terraform | Infra/CloudOps | octobre 2025 |
| Configuration réseau Paris | Zscaler, DNS, NSG | IT Paris | octobre 2025 |
| Déploiement AKS Paris | Cluster + services | DevOps | octobre 2025 |
| Pipelines CI/CD | GitLab + déploiement auto | DevOps | octobre 2025 |
| Monitoring Paris | Grafana + alerting | DevOps | novembre 2025 |
| Mise en service Genève | Basculer utilisateurs | IT Genève | 3 novembre 2025 |

---

### 🔹 Phase 3 bis – Validation hybride (novembre 2025)

| Tâche principale | Sous-tâches | Responsable | Échéance |
|------------------|-------------|-------------|----------|
| Connexions sécurisées | Validation tunnels | Réseau | novembre 2025 |
| Tests accès | Messagerie, CRM, SaaS | IT + Business | novembre 2025 |
| Validation sécurité | MFA, RBAC, Zscaler | Sécurité | novembre 2025 |
| Validation IT Ops | Rôles, responsabilités | DSI + RH | novembre 2025 |
| Validation PRA/PCA | Tests finaux | DSI + SecOps | novembre 2025 |

---

### 🔹 Phase 4 – Clôture & Désengagement (décembre 2025)

| Tâche principale | Sous-tâches | Responsable | Échéance |
|------------------|-------------|-------------|----------|
| Fermeture Paris | Déconnexion équipements | IT Paris | novembre 2025 |
|  | Inventaire matériel retiré | IT Paris | novembre 2025 |
| Libération locaux | Démontage, résiliation | Logistique | 1er décembre 2025 |
| Archivage Git | Terraform, Ansible | CloudOps | décembre 2025 |
| Documentation finale | Technique + sécurité | DSI | décembre 2025 |

---
