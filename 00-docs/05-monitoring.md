# 05 - Monitoring & Supervision

Ce répertoire centralise toute la stratégie de **supervision proactive** de l'infrastructure, des applications et des utilisateurs, en intégrant des outils de type Prometheus, Grafana, EDR/XDR, SIEM et autres solutions spécialisées réseau/cloud.

---

## Objectifs

- Supervision 24/7 des services critiques (serveurs, conteneurs, réseaux, bases de données).
- Détection et alerte en cas d’anomalies ou de pannes.
- Intégration avec des solutions EDR/XDR pour la sécurité proactive.
- Corrélation d’événements de sécurité via des solutions SIEM.
- Reprise automatique des systèmes de monitoring en cas de sinistre (PRA/PCA).

---

## Composants clés

### Prometheus

- `prometheus.yml` : Fichier de configuration principal.
- `rules/` : Règles d’alerte par type (infra, app).
- `exporters/` : Exporters pour CPU, réseau, etc.
- Réplication dans PRA/PCA prévue pour assurer continuité.

### Grafana

- Dashboards JSON : Suivi en temps réel des clusters Kubernetes, métriques business et infra.
- Datasource : Connexion à Prometheus.
- Alertes visuelles et audit via les panels.

### Alertmanager

- Alerting centralisé vers PagerDuty, OpsGenie, email.
- Routing des alertes selon criticité.

### EDR / XDR

- Intégration avec :
  - CrowdStrike Falcon
  - SentinelOne
  - Cortex XDR
- Suivi en temps réel des endpoints, détection de menaces, réponse automatisée.

### SIEM

- Microsoft Sentinel (ou ELK Stack)
- Centralisation des logs
- Corrélation des événements
- Dashboards de sécurité

### Réseau & Infra

- **Cisco Meraki** : Supervision WiFi, sécurité réseau, QoS.
- **SolarWinds NPM** : Monitoring des performances réseau.
- **vRealize / Virtualization Manager** : Suivi des environnements virtualisés.

###  Scripts

- `monitoring_check.ps1` : Vérification automatique des composants critiques.
- `incident_trigger_simulation.sh` : Simulation d’incident pour tester alertes.
- `restore_monitoring_stack.sh` : Restauration rapide après incident (intégré au PRA).

---

##  PRA / PCA

- Réplication automatique des stacks Prometheus / Grafana.
- Scripts de redéploiement en cas de sinistre.
- Intégration avec le module `06-pca-pra/`.

---

## À venir

- Intégration ServiceNow pour corrélation alertes/incidents.
- Automatisation via Ansible pour le provisionnement de l’environnement de supervision.

---

## Équipes impliquées

- **DevOps** : Déploiement et supervision des pipelines, intégration monitoring CI/CD.
- **SecOps (SOC)** : Surveillance sécurité, intégration SIEM & EDR.
- **Infra** : Gestion réseau/VM/serveurs et alertes associées.

---

## Références

- Prometheus Docs: https://prometheus.io/docs/
- Grafana Docs: https://grafana.com/docs/
- Azure Sentinel KQL: https://learn.microsoft.com/en-us/azure/sentinel/
- SolarWinds: https://www.solarwinds.com/
