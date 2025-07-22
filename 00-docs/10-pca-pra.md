# 10. Plan de Continuité et de Reprise d’Activité (PCA/PRA)

## Objectifs

Garantir la continuité des services critiques et la reprise rapide en cas de sinistre majeur, dans un contexte hybride (Azure + On-Premises) réparti sur plusieurs sites (Paris – Genève).

---

## 1. Sauvegarde et restauration

- Sauvegardes régulières des données et volumes persistants via des solutions robustes telles que **Veeam**, **Azure Backup**, **Zerto** ou **Rubrik**.
- Intégration des systèmes de fichiers critiques dans le PRA/PCA.
- Restauration prioritaire de **l’Active Directory** pour garantir l’accès aux ressources critiques.
- Réplication des données sur plusieurs sites avec test régulier des plans de restauration.
- Scénarios de bascule automatique vers les environnements cloud en cas de défaillance locale.

---

## 2. Réseaux et sécurité

- Application des principes **Zero Trust** avec des solutions comme **Zscaler** ou **Palo Alto Prisma Access** pour sécuriser les accès.
- Redirection automatique vers des environnements sécurisés de secours en cas de compromission.
- Intégration des solutions **EDR/XDR** (ex. CrowdStrike, SentinelOne, Cortex XDR) avec reprise rapide (< 30 min) après incident grâce à des architectures redondantes.

---

## 3. Supervision et journalisation

- Mise en place d’un **SIEM** Splunk pour la collecte et la corrélation des logs.
- Réplication du SIEM prévue dans le PRA pour garantir la continuité de la surveillance.
- Restauration automatique des systèmes de monitoring et d’alerte (Prometheus, Grafana, Azure Monitor) après incident.

---

## 4. Infrastructure VDI et utilisateurs

- Réplication des **sessions VDI** pour garantir la continuité des postes utilisateurs en cas de panne serveur.
- Redondance des postes critiques avec synchronisation des images système sur machines de secours.
- **PC portables sécurisés** pour les utilisateurs nomades (MFA, biométrie), gérés via MDM (Microsoft Intune, Jamf).

---

## 5. Automatisation et IaC

- Restauration des configurations **IaC** (Terraform, Ansible) en cas de défaillance.
- Reprise automatisée des **pipelines CI/CD**, jobs de déploiement et workflows.
- Tests réguliers de la stratégie PRA/PCA avec validation des **objectifs RTO/RPO**.

---

## 6. Formation et tests

- **Formation des équipes internes** aux procédures PRA/PCA.
- Scénarios de simulation avec restauration des services.
- Suivi du déploiement, des tests et validation via **diagramme de Gantt**.

---

## 7. Synthèse

Cette solution hybride offre une **stratégie de résilience complète** intégrant :
- Une couverture multi-sites (Paris – Genève),
- Des environnements on-premises et cloud (Azure),
- Des mécanismes automatisés de bascule, restauration, supervision, et protection.

Elle garantit la **continuité de service, la sécurité, et l’optimisation des coûts** à travers un PRA/PCA éprouvé, testé et automatisé.

🔗 Voir les politiques de sauvegarde et restaurations détaillées dans [`global_backup_policy.md/`](../global_backup_policy.md/)


