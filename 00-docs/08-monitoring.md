# 08 Stratégie unifiée de Monitoring & Supervision – Projet CYNA (Paris <-> Genève)

## 1. Objectifs clés

- Supervision 24/7 des infrastructures hybrides (On-Prem + Azure).
- Alertes en temps réel sur les performances, la sécurité et la disponibilité.
- Centralisation des métriques systèmes, applicatifs, réseau, conteneurs.
- Mise en place d’un PRA/PCA supervisé et automatisé.
- Rationalisation des outils pour réduire les coûts et simplifier la gestion.

---

## 2. Stack de Supervision (solution unifiée et rationalisée)

| Domaine                         | Solution retenue (optimisée)                  | Pourquoi ce choix ?                                           |
|---------------------------------|-----------------------------------------------|----------------------------------------------------------------|
| **Kubernetes / AKS**           | Prometheus + Grafana                          | Intégration native, extensible, open-source, pas de licence     |
| **Alerting**                   | Alertmanager + OpsGenie (ou PagerDuty)        | Escalade flexible, multi-canal                                 |
| **Cloud Azure**                | Azure Monitor + Log Analytics                 | Intégration native avec ressources Azure                       |
| **Système & Réseau (On-Prem)** | **Zabbix** *(remplace Nagios, PRTG, SolarWinds)* | Supervision complète, agents légers, open-source              |
| **Parc IT & MDM**              | Microsoft Intune                              | Déjà intégré M365, gestion unifiée des terminaux              |
| **Sécurité Endpoints**         | EDR/XDR (Microsoft Defender for Endpoint)     | Intégration Azure + Intune                                     |
| **Base de données**            | Exporters Prometheus + Azure Monitor          | DB métriques + logs en temps réel                              |
| **Automatisation**             | Terraform + Ansible                           | Infrastructure as Code + déploiements automatisés             |

 Tous ces outils sont interconnectables via **Grafana** comme portail central de visualisation.

---

## 3. Supervision Kubernetes/Conteneurs

- Déploiement de **Prometheus Operator** (via Helm).
- Exporters clés : `node-exporter`, `kube-state-metrics`, `cAdvisor`, `etcd`, `Istio`.
- Dashboards Grafana prédéfinis (pods, CPU, RAM, HPA, traffic ingress/egress).
- Sauvegarde des volumes persistants : **Kasten K10** (Velero possible aussi).

---

## 4. Supervision réseau & on-prem

- **Zabbix** :
  - Supervision agents sur serveurs, switches, firewalls.
  - Cartographie réseau dynamique.
  - Détection de panne & alertes personnalisables.
- Intégration de Cisco Meraki pour WiFi et QoS (via API).
- Dashboards Grafana à partir des données Zabbix via plugin natif.

---

##  5. Monitoring Cloud (Azure)

- **Azure Monitor** :
  - Intégration directe avec AKS, VMs, SQL Server, Azure Storage.
  - Collecte des logs, métriques, alertes.
- **Log Analytics** : Requêtes KQL avancées + corrélation.
- Connexion Grafana via Azure Monitor datasource pour centralisation.

---

## 6. Supervision sécurité & accès

- Supervision centralisée EDR/XDR.
- Journalisation des accès sensibles via SIEM (optionnel ELK/EFK).
- RBAC pour accès Grafana et consoles de monitoring.

---

## 7. Automatisation & PRA

- Déploiements automatisés :
  - `Helm` pour les charts Kubernetes.
  - `Terraform` pour infrastructure (Azure + On-prem).
  - `Ansible` pour provisioning & configuration.
- Scénario PRA :
  - Détection de panne via Zabbix / Prometheus.
  - Basculement automatisé sur nœuds disponibles (Azure Load Balancer).
  - Redémarrage des dashboards et sondes automatisé.

---

## 8. Optimisation des coûts

| Outil                         | Coût            | Justification                              |
|------------------------------|------------------|---------------------------------------------|
| Prometheus / Grafana OSS     | Gratuit           | Auto-hébergé, très modulaire                 |
| Zabbix OSS                   | Gratuit           | Supprime besoin de Nagios, PRTG, SolarWinds |
| Azure Monitor                | À l’usage         | Pay-per-use, facturation maîtrisable        |
| Intune + Defender            | M365 Entreprise   | Inclus dans E5 ou via licence dédiée        |
| OpsGenie / PagerDuty         | Selon abonnement  | Essentiel pour alerting professionnel       |
| Kasten K10                   | Licence par noeud | À évaluer selon volumétrie sauvegarde       |

---

## 9. Visualisation unique : Grafana

- Dashboard unifié :
  - Kubernetes + On-Prem + Azure
  - Réseau + DB + EDR/XDR
- Sécurité :
  - Authentification via SSO (Azure AD)
  - RBAC (accès par rôle/projet)
- Plugins :
  - Zabbix, Azure Monitor, PostgreSQL, Loki (optionnel), JSON API

---

## ✅ 10. Résumé
Cette solution répond aux contraintes d’un modèle SaaS multi-sites (Paris – Genève) en combinant supervision, sécurité et résilience sur les environnements cloud (Azure) et on-prem. 
Nous avons volontairement retenu une approche minimaliste, efficace, et évolutive.
Nous avons privilégié une solution allégée mais robuste, capable de superviser efficacement l’ensemble de l’infrastructure hybride entre Paris et Genève,
tout en optimisant les coûts et la simplicité d’exploitation :

- ❌ Supprime la redondance entre Nagios, PRTG, SolarWinds, etc.
- ✅ Centralise toutes les vues (cloud + on-prem) dans **Grafana**
- ✅ Automatise avec **Terraform / Ansible**
- ✅ Aligne avec les exigences **PRA/PCA**
- ✅ Reste **économique**, **scalable**, **interopérable**

---

> Cette solution s’adapte parfaitement à un modèle SaaS multi-sites (Paris - Genève) avec des infrastructures cloud (Azure) et on-prem tout en assurant la supervision, la sécurité, et la résilience de bout en bout.
