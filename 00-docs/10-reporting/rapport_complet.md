# Rapport Complet – Suivi, Sécurité, Logiciels, Recette et Automatisation

---

##  Rapport Mensuel

### Mois concerné : Novembre 2025

#### Activités réalisées :
- Mise en place des solutions EDR/XDR sur l’ensemble du parc informatique.
- Configuration initiale de Graylog et QRadar pour centralisation des logs.
- Tests de détection d’anomalies réseau avec alertes automatisées.
- Déploiement des agents SentinelOne via Intune/Ansible.
- Synchronisation des scripts CI/CD avec pipeline GitLab.

#### Incidents notables :
-  Tentative de brute-force sur serveur AD Genève détectée et bloquée.
-  Erreur de synchronisation temporaire des logs Paris vers QRadar Azure.

#### Correctifs appliqués :
- Mise à jour des règles de pare-feu internes.
- Ajout de sources de logs depuis Paris vers Graylog via VPN sécurisé.

---

## Rapport de Sécurité – SIEM, EDR/XDR, Graylog

### Outils déployés :

| Solution        | Rôle principal                     | État actuel |
|-----------------|------------------------------------|-------------|
| SentinelOne     | Protection EDR/XDR endpoints       | ✅ Actif     |
| IBM QRadar      | SIEM – Corrélation sécurité        | ✅ En place  |
| Graylog         | Collecte + analyse de logs         | ✅ Actif     |

### Tableaux de bord :
- Dashboards QRadar intégrés à Microsoft 365 (OneDrive, Exchange, Teams).
- Graylog : alertes sur shadow IT, port scanning, échecs de login massifs.
- Export PDF/CSV pour audits mensuels.

### Recommandations :
- Ajout de Cortex XDR pour analyse comportementale avancée.
- Automatiser les réponses aux incidents via IBM Resilient (SOAR).

---

## Bordereau des Logiciels Installés

| Logiciel             | Version       | Emplacement                      |
|----------------------|---------------|----------------------------------|
| SentinelOne Agent    | v23.4.0       | Endpoints (PC & Serveurs)        |
| IBM QRadar SIEM      | 7.5.0         | VM Azure Europe (Genève)         |
| Graylog              | 5.1.2         | VM On-Prem Paris                 |
| Terraform            | v1.5.5        | Pipelines GitLab                 |
| Veeam Backup         | 12.0.0.1420   | Site Paris + Site Genève         |
| Microsoft Teams      | SaaS M365     | Tous les utilisateurs            |

---

## Procès-Verbal de Recette

### Date : 21/07/2025
### Participants :
- Chef de Projet Infrastructure
- MOA
- Responsable Sécurité
- Intégrateur IT

### Résultats des Tests :

| Élément testé        | Objectif                              | Résultat |
|----------------------|----------------------------------------|----------|
| Détection malware    | Rollback automatique (SentinelOne)     | ✅ OK     |
| Dashboards Graylog   | Monitoring & alerting personnalisés    | ✅ OK     |
| Corrélation QRadar   | Intégration logs Azure/AD/Intune       | ✅ OK     |
| Gestion terminaux    | Application politique via Intune       | ✅ OK     |

### Écarts et Remarques :
- Le connecteur Cortex XDR vers QRadar reste à finaliser (fonction non critique).
- Recette validée avec réserves mineures, à régulariser sous 15 jours.

---

## Suivi Git & Automatisation

### Automatisation déployée :
- Ansible : déploiement agents, sécurité, journaux.
- Terraform : infrastructure réseau & sécurité en Azure.
- Scripts de reporting automatisés (bash + cron) vers SFTP sécurisé.

### Extraits de commits Git (GitLab) :

```bash
commit a1c98d2
Author: S. DIA
Message: Ajout règles brute-force QRadar

commit b7e63f1
Message: Déploiement SentinelOne via Ansible (groupe Genève)

commit 3a45d7f
Message: Dashboards Graylog pour détection Shadow IT
