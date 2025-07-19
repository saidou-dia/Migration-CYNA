# Planning Gantt du projet CYNA

| Phase                      | Tâche principale                     | Sous-tâche                            | Responsable       | Échéance           |
|----------------------------|------------------------------------|-------------------------------------|-------------------|--------------------|
| **Phase 1 – Préparation & Cadrage** | Audit IT matériel & logiciel Paris  | Inventaire postes, serveurs, logiciels | IT Paris          | 15 juillet 2025    |
|                            | Audit IT matériel & logiciel Paris  | Vérification compatibilité cloud     | IT Paris          | 15 juillet 2025    |
|                            | Choix du prestataire matériel (Suisse) | Consultation fournisseurs           | DSI + Achats      | 31 juillet 2025    |
|                            | Choix du prestataire matériel (Suisse) | Comparatif devis et délais          | DSI + Achats      | 31 juillet 2025    |
|                            | Souscription Azure                  | Création compte, tenant              | IT Genève         | Juillet 2025       |
|                            | Souscription Azure                  | Activation licences nécessaires      | IT Genève         | Juillet 2025       |
|                            | Création tenant Azure + RG + VNet  | Créer souscriptions, RG, VNet        | IT Genève         | Juillet 2025       |
|                            | Mise en place Entra ID, Intune, Defender | Déploiement MFA + Intune policies  | Sécurité          | Juillet 2025       |
|                            | Définition stratégie Terraform & Ansible | Création des modules de base       | Infra             | Juillet 2025       |
|                            | Préparation module azure_paris     | Définir RG, NSG, stockage, compute   | Infra             | Juillet 2025       |
|                            | Choix outils CI/CD                  | Comparatif GitLab/Jenkins            | DevOps            | Juillet 2025       |
|                            | Stratégie PRA/PCA                  | Choix régions Azure + topologie DR   | Infra/Sécurité    | Juillet 2025       |
| **Phase 2 – Infra Genève & Connexions** | Mise en place infra physique Genève | Installation serveurs + baie        | IT Genève         | Septembre 2025     |
|                            | Déploiement Azure Genève           | Terraform RG, VNet, NSG, AKS         | Infra             | Août 2025          |
|                            | Déploiement AKS Genève             | Installation Helm, ingress controller | DevOps            | Août 2025          |
|                            | Connexion sécurisée Paris ↔ Azure  | Configurer VPN ou SD-WAN              | Réseau            | Début août 2025    |
|                            | Monitoring Prometheus              | Déploiement Prometheus, Node Exporter | DevOps            | Août 2025          |
|                            | Sauvegarde Paris vers Azure        | OneDrive/SharePoint + fichiers serveurs | CloudOps        | Août 2025          |
|                            | Connexion Azure ↔ Genève           | Configurer VPN IPsec ou Azure vWAN   | Réseau            | Fin août 2025      |
|                            | Tests PRA                        | Simulation coupure + restauration     | IT Genève         | Septembre 2025     |
|                            | Connexion intersites Genève ↔ Paris | Peering ou VPN direct                | Réseau            | Septembre 2025     |
|                            | Tests latence et redondance        | Tests ICMP, sécurité Zscaler          | Sécurité          | Septembre 2025     |
| **Phase 3 – Migration & Mise en Service** | Migration utilisateurs Paris → Genève | Déplacement données utilisateurs    | IT Paris/Genève   | Octobre 2025       |
|                            | Création filiale Paris via azure_paris | Terraform + config réseau Paris     | Infra + CloudOps  | Octobre 2025       |
|                            | Reconfiguration filtrage local Paris | Zscaler, DNS, règles NSG            | IT Paris          | Octobre 2025       |
|                            | Déploiement AKS Paris             | Cluster + services applicatifs        | DevOps            | Octobre 2025       |
|                            | Lancement pipelines CI/CD          | Déploiement automatique via GitLab   | DevOps            | Octobre 2025       |
|                            | Monitoring Paris                  | Dashboards Grafana + alerting         | DevOps            | Novembre 2025      |
|                            | Mise en service du site Genève     | Basculer les accès + validation finale | IT Genève         | 3 novembre 2025    |
| **Phase 3 bis – Validation Hybride** | Finalisation connexions sécurisées | Validation tunnel complet ou split    | Réseau            | Novembre 2025      |
|                            | Tests d’accès aux services critiques | Tests messagerie, CRM, SaaS          | IT + Business     | Novembre 2025      |
|                            | Validation filtrage + accès        | Politiques Zscaler, MFA, RBAC         | Sécurité          | Novembre 2025      |
|                            | Rôles IT validés                 | Définir qui gère quoi entre Paris/Genève | DSI + RH          | Novembre 2025      |
|                            | Validation PRA/PCA hybride         | Tests + acceptation finale             | DSI + SecOps      | Novembre 2025      |
| **Phase 4 – Clôture & Désengagement** | Fermeture zones Paris non utilisées | Déconnexion équipements, inventaire | IT Paris          | Novembre 2025      |
|                            | Démontage, résiliation, libération locaux | Clôture contrats, retrait matériel  | Logistique        | 1er décembre 2025  |
|                            | Archivage config Terraform & Ansible | Push final dans Git, tagging         | Infra/CloudOps    | Décembre 2025      |
|                            | Livraison documentation finale    | Consolidation docs projet + sécurité  | DSI               | Décembre 2025      |
