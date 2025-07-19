04 - Postmigration - Retour - Filiale - Paris
## Objectifs

- Supervision des workloads (Kubernetes, serveurs)  
- Centralisation des logs système et applicatifs  
- Suivi des performances réseau et applicatif  
- Mise en place d’alerting proactif

## Outils déployés

- Prometheus pour la collecte de métriques  
- Grafana pour la visualisation  
- Loki pour la gestion centralisée des logs  
- Alertmanager pour la gestion des alertes  
- Node Exporter pour les serveurs physiques/VM  
- Kube-State-Metrics pour les clusters Kubernetes

## Intégrations

- Connexion aux clusters Kubernetes (Genève + Azure)  
- Export de métriques depuis FortiGate (via SNMP)  
- Intégration des logs applicatifs SaaS  
- Dashboard dédiés pour les équipes Dev et Ops

## Points de vigilance

- Gestion des droits d’accès sur Grafana (RBAC)  
- Capacité de stockage pour les logs (rotation, rétention)  
- Latence possible sur certaines métriques à distance  
- Sécurisation des endpoints Prometheus / Grafana

## Prochaines étapes

- Ajout de métriques personnalisées pour les services critiques  
- Automatisation du déploiement avec Ansible  
- Revue régulière des seuils d’alerte  
- Extension de la supervision à la filiale de Paris
