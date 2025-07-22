# 13.  FAQ & Troubleshooting Guide

Ce document regroupe les réponses aux questions fréquentes (FAQ) ainsi qu'un guide de résolution des problèmes rencontrés lors de la migration de l’environnement IT de Paris et Genève vers Azure.

---

## 1. FAQ (Questions Fréquentes)

### Que faire si une VM ne démarre pas après la migration ?
- **Réponse** : Vérifier dans Azure Portal :
  - L’état de la VM (stoppée, désallouée)
  - Les logs de démarrage dans la section "Boot diagnostics"
  - L'association du réseau virtuel et du NSG
  - Si le disque système a bien été attaché

---

### Comment savoir si un service est bien migré ?
- **Réponse** :
  - Valider la connectivité réseau (ping, telnet, RDP/SSH)
  - Vérifier les journaux d’audit et les logs d’application
  - Vérifier dans Azure Monitor ou Log Analytics les métriques du service
  - Exécuter les tests post-migration définis dans le plan de validation

---

### Où sont stockées les sauvegardes ?
- **Réponse** :
  - Dans Azure Backup Recovery Vault (région France Central / Switzerland North)
  - Les sauvegardes sont configurées via des policies journalières et hebdomadaires

---

### Peut-on revenir en arrière si un service Azure ne fonctionne pas ?
- **Réponse** :
  - Oui, via les snapshots ou les backups des VMs/services
  - Les scripts de rollback sont fournis pour chaque type de service (VM, AppService, etc.)
  - RTO/RPO définis dans la stratégie PRA/PCA

---

### Comment accéder à une VM depuis Paris/Genève ?
- **Réponse** :
  - Vérifier les règles de NSG, le Bastion Host ou la configuration VPN site-to-site
  - Si besoin, demander un accès temporaire via le support technique

---

## 2. Problèmes Courants & Résolutions

### Problème : Perte de connectivité vers une VM Azure
- **Cause possible** :
  - Mauvaise configuration du NSG
  - DNS mal configuré
  - Adresse IP dynamique non réservée
- **Résolution** :
  - Vérifier les NSG/UDR
  - Redémarrer la VM
  - Réserver une IP statique si nécessaire

---

### Problème : Lenteur d’accès à une application post-migration
- **Cause possible** :
  - Latence réseau entre les régions
  - Plan de service sous-dimensionné
- **Résolution** :
  - Analyser avec Azure Network Watcher
  - Surveiller via Azure Application Insights
  - Monter en SKU ou activer autoscale

---

### Problème : Échec de déploiement Terraform / Ansible
- **Cause possible** :
  - Variables d’environnement manquantes
  - Permissions insuffisantes (RBAC)
  - Conflit de ressource (nom déjà existant)
- **Résolution** :
  - Vérifier les logs CI/CD
  - Tester le script localement avec un dry-run
  - Ajouter les mécanismes de rollback dans le pipeline

---

### Problème : Les sauvegardes ne s’exécutent pas
- **Cause possible** :
  - Policy non attachée à la ressource
  - Vault non autorisé à accéder à la ressource
- **Résolution** :
  - Aller dans Recovery Services Vault > Backup Items
  - Réassocier la VM ou service concerné
  - Lancer une sauvegarde manuelle pour test

---

## 3. Bonnes pratiques de diagnostic

- Activer **Azure Monitor** sur toutes les ressources critiques
- Utiliser **Log Analytics Workspaces** pour centraliser les logs
- Créer des **alertes personnalisées** pour détecter les anomalies (CPU, erreurs HTTP, etc.)
- Utiliser **Network Watcher** pour tracer les paquets et identifier les goulets d’étranglement réseau
- Consulter les **journaux d'activité Azure** pour toute opération anormale ou manuelle

---

## 4. Ressources utiles

| Ressource                            | Lien / Emplacement                                    |
|--------------------------------------|--------------------------------------------------------|
| Portail Azure                        | https://portal.azure.com                              |
| Terraform Cloud / Git Repo IaC       | [git.cyna.local/migration/terraform](#)               |
| Documentation Azure                  | https://learn.microsoft.com/en-us/azure/              |
| Dashboards Log Analytics             | Azure Monitor > Log Analytics > Workspaces            |
| CI/CD Pipelines GitLab/Jenkins       | [git.cyna.local/devops/cicd](#)                       |
| Canal support interne                | Teams > Canal #infra-cloud-support                    |

---

*Document rédigé par :DIA Saidou
*Version : 1.0*  
*Dernière mise à jour : 19/07/2025  
