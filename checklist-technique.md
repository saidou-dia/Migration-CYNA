#  Checklist Technique de Migration – Projet CYNA

Ce document liste les **tâches techniques critiques** à réaliser dans le cadre de la migration des infrastructures IT de Paris vers Genève & Azure.

---

##  1. Phase d'Audit (Paris)

- [ ] Inventaire complet des postes de travail, serveurs et périphériques.
- [ ] Liste des applications installées par poste/serveur.
- [ ] Cartographie réseau actuelle.
- [ ] Vérification des dépendances applicatives locales.
- [ ] Validation des compatibilités avec Azure / Cloud.

---

##  2. Préparation des environnements (Genève + Azure)

- [ ] Création du tenant Azure & des abonnements.
- [ ] Mise en place des Resource Groups (RG).
- [ ] Création et configuration des Virtual Networks (VNet).
- [ ] Configuration des NSG, routes, DNS privés.
- [ ] Déploiement d’AKS + intégration Helm, ingress, autoscaling.
- [ ] Configuration d’Azure AD, Intune, Defender, Sentinel.
- [ ] Mise en place d’Azure Log Analytics & Azure Monitor.

---

##  3. Réseaux et Sécurité

- [ ] Configuration VPN IPsec site-à-site Paris ↔ Genève.
- [ ] Sécurisation de la connectivité avec Zscaler / FortiGate SD-WAN.
- [ ] Mise en place des VLANs à Genève + segmentation par rôle.
- [ ] Intégration des pare-feux nouvelle génération (NGFW).
- [ ] Tests de latence et de redondance entre sites.

---

##  4. Tests avant migration

- [ ] Tests d’authentification Azure AD / MFA.
- [ ] Tests d'accès aux ressources Cloud depuis Paris.
- [ ] Tests de performance réseau (Genève ↔ Azure).
- [ ] Simulation de PRA/PCA à blanc.
- [ ] Vérification intégration CI/CD GitLab / Terraform.

---

##  5. Migration effective

- [ ] Transfert des profils utilisateurs et données (OneDrive / SharePoint).
- [ ] Migration des postes (via Intune ou Autopilot).
- [ ] Déploiement des applications via Endpoint Manager / scripts.
- [ ] Réplication et bascule des services SaaS internes.
- [ ] Bascule DNS & validation réseau local (NSG, routes).

---

##  6. Vérifications post-migration

- [ ] Contrôle de l’accès aux applications métiers.
- [ ] Vérification de la supervision Prometheus / Zabbix / Azure Monitor.
- [ ] Vérification des politiques de sécurité (EDR/XDR, Defender, Zscaler).
- [ ] Validation des sauvegardes Cloud et PRA.
- [ ] Rapport de migration, performance, sécurité.

---

##  7. Fermeture Paris & Archival

- [ ] Sauvegarde finale des données résiduelles.
- [ ] Déconnexion du matériel et de l’ancien réseau.
- [ ] Désactivation des anciennes licences / services.
- [ ] Archivage des scripts Terraform / Ansible / Helm.
- [ ] Documentation finale et PV de recette.

---

##  Équipes impliquées

| Domaine         | Responsable            |
|----------------|------------------------|
| Infrastructure | IT Genève              |
| Cloud & Azure  | CloudOps               |
| Sécurité       | SecOps / MSSP          |
| Déploiement    | DevOps / Admins Paris  |
| Support        | Helpdesk Paris & Genève|

---

>  **À suivre** : ajout d’un planning détaillé des migrations par lot d’utilisateurs et par service.
