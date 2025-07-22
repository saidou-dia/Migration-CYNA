# 🛠️ Migration – Contexte & Étapes

## 1. Contexte général

Dans le cadre de son **déménagement vers Genève**, la société **CYNA** entreprend une **modernisation complète de son infrastructure IT**, avec un objectif double :

-  Optimiser les performances et la disponibilité des services.
-  Renforcer la sécurité (Zero Trust, EDR/XDR, segmentation SD-WAN).

L'ensemble des collaborateurs (env. 200) sera regroupé dans le nouveau siège à Genève, tandis qu’une **filiale à Paris** sera ouverte, servant de **point d’accès sécurisé** aux services hébergés à Genève et dans le Cloud Azure.

---

## 2. Objectifs de la migration

-  **Transfert de l’environnement informatique** vers les nouveaux locaux à Genève.
-  **Adoption d’une infrastructure Cloud hybride** (Azure + On-Premises).
-  Mise en place de connexions sécurisées Paris ↔ Genève ↔ Azure.
-  Uniformisation des équipements entre Genève et Paris.
-  Intégration d’une **plateforme SaaS** pour la gestion des infrastructures de sécurité.
-  Renforcement de la cybersécurité via EDR, XDR, Sentinel, Intune, Zero Trust.
-  Réplication des sauvegardes & supervision dans un contexte PRA/PCA.

---

## 3. Ce qui est à migrer / moderniser

### Infrastructures techniques

| Domaine              | Détails |
|----------------------|---------|
| **Postes utilisateurs** | Migration profils, données, OneDrive/SharePoint |
| **Serveurs applicatifs** | Vers Azure ou AKS (Kubernetes) |
| **Infrastructure réseau** | Nouvelle topologie SD-WAN, VPN IPsec, VLAN |
| **Systèmes de sauvegarde** | Refonte avec Veeam, sauvegarde Cloud vers Azure |
| **Supervision** | Migration vers Prometheus, Grafana, Zabbix |
| **CI/CD** | Déploiement pipelines GitLab, Terraform, Ansible |
| **Sécurité** | Intégration EDR/XDR, Zscaler, Azure Defender |

---

### Applications métiers et SaaS

- ERP / Gestion financière / RH
- CRM
- Suite collaborative Microsoft 365
- Plateforme SaaS cybersécurité (développée en interne)
- Futur site e-commerce (prévu après la migration)

---

## 4. Étapes clés de la migration

| Étape | Description |
|-------|-------------|
| **Audit IT** | Inventaire matériel/logiciel à Paris |
| **Préparation des environnements Genève + Azure** | RG, VNet, AKS, Intune |
| **Déploiement réseaux** | Connexions Paris ↔ Genève ↔ Azure |
| **Transfert utilisateurs** | Données, profils, outils bureautiques |
| **Bascules applicatives** | Services internes vers Cloud / AKS |
| **Tests** | Vérification accès, sécurité, PRA, performances |
| **Clôture Paris** | Déconnexion infra, restitution matériel |

---

## 5. Résumé

La migration vise une **infrastructure moderne, hybride et résiliente**, en renforçant la **cybersécurité**, la **supervision** et la **flexibilité** des services hébergés.  
Elle constitue une **étape clé** dans la stratégie de transformation numérique de Cyna.

