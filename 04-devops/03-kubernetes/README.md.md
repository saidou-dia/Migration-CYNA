# 07 - Kubernetes

## 1. Objectifs

- Déployer et gérer des clusters Kubernetes pour les applications SaaS de CYNA.
- Garantir la haute disponibilité, la scalabilité et la tolérance aux pannes.
- Intégrer les outils de monitoring, de sécurité, de backup, et de gestion des accès.
- Automatiser le cycle de vie complet des applications (CI/CD).
- Maintenir la conformité aux politiques Zero Trust et aux standards DevSecOps.

---

## 2. Architecture Kubernetes

- Clusters distincts pour **Genève** et **Paris**, intégrés à **Azure Kubernetes Service (AKS)**.
- **Infrastructure hybride** avec connectivité inter-site sécurisée (VPN ou ExpressRoute).
- Utilisation de **namespaces** pour isoler les environnements : `production`, `staging`, `dev`.
- **Autoscaling horizontal (HPA)** pour adapter dynamiquement les ressources en fonction de la charge.
- Séparation des workloads critiques (base de données, frontend) et non critiques (jobs batch, tâches async).
- **Self-healing** : redémarrage automatique des pods défaillants.
- **Load Balancing** via Azure Load Balancer ou Traefik/NGINX Ingress Controller.

---

## 3. Déploiement des Applications

- Utilisation de **Helm charts** pour le packaging, le versioning et le déploiement.
- Définition des manifests Kubernetes pour :
  - `Deployments`, `StatefulSets`
  - `Services`, `Ingress`, `ConfigMaps`, `Secrets`
- Stratégies de mise à jour :
  - `rollingUpdate` (sans interruption)
  - `blue/green` ou `canary` (selon besoin)
- Gestion centralisée des secrets via :
  - **Azure Key Vault** intégré à AKS, ou
  - **External Secrets Operator** ou `sealed-secrets` pour rotation automatique.

---

## 4. CI/CD & Automatisation

- Pipelines CI/CD automatisés via :
  - **GitHub Actions** / **GitLab CI** / **Azure DevOps**
- Intégration avec :
  - **Terraform** pour le provisionnement de l’infrastructure AKS.
  - **Ansible** pour la configuration post-déploiement et le durcissement.
- Déploiements automatisés avec :
  - `kubectl`, `Helm`, ou **ArgoCD** pour la livraison continue GitOps.
- Scripts dédiés pour :
  - Mise à jour des images (`imagePullPolicy`)
  - Autoscaling/Cluster scaling
  - Nettoyage (`jobs`, `pods`, `volumes`) automatisé

---

## 5. Monitoring & Alerting

- Collecte des métriques avec **Prometheus**.
- Dashboards personnalisés via **Grafana**.
- Intégration de **Azure Monitor for containers** pour la supervision native dans Azure.
- Alertes basées sur des seuils critiques :
  - CPU, RAM, latence, erreurs HTTP, saturation des volumes, etc.
- Exportation des logs vers :
  - **ELK Stack**, **Azure Log Analytics**, ou **Fluentd** selon les besoins.

---

## 6. Sécurité

- Application du principe **Zero Trust** sur les accès cluster et services.
- **RBAC (Role-Based Access Control)** strict sur les namespaces et ressources.
- **NetworkPolicies** pour limiter les communications inter-pods et inter-namespaces.
- Intégration avec solutions **XDR/EDR** pour une détection avancée des menaces.
- Scan de vulnérabilités via :
  - **Trivy**, **Aqua**, ou **Azure Defender for Containers**
- Politique DevSecOps :
  - Linting YAML, validation OPA/Gatekeeper/Kyverno, secrets scan en CI.

---

## 7. Sauvegarde & Restauration

- Sauvegarde des volumes persistants avec **Kasten K10 (Veeam)** pour Kubernetes.
- Gestion des stratégies de sauvegarde (rétention, encryption, multi-tenant).
- Support natif des applications stateful (MySQL, PostgreSQL, MongoDB, etc.).
- Intégration avec le stockage objet **Azure Blob Storage** pour les backups.
- Plans de restauration granulaires : namespace, application, PVC, config, etc.
- Test périodique des restaurations pour valider les scénarios de PRA.
- Complémentarité avec **Azure Backup** pour les ressources hors AKS.

---

## 8. Conformité, Audit & Gouvernance

- Intégration avec **Azure Policy**, **Azure Security Center**, ou **Kubernetes Policy Engine (Kyverno)**.
- Traces d’audit via **Azure Monitor Logs** ou **Falco**.
- Logs centralisés et archivés pour les besoins RGPD, ISO 27001, SOC 2, etc.

---

## 9. Livraison et Planning

- Livraison complète de l’infrastructure cloud et Kubernetes dans un délai de **4,5 mois** :
  - Mise en place de l'architecture hybride (Azure + On-prem).
  - Déploiement AKS, CI/CD, Prometheus/Grafana, backup/restore.
  - Scripts **Terraform**, **Ansible**, **Helm**, **kubectl** livrés et documentés.
  - Documentation complète incluse + tests de PRA + rollback validé.

---

## 10. Stack utilisée

| Composant         | Technologies                                         |
|------------------|------------------------------------------------------|
| Orchestration     | Kubernetes (AKS), Helm, kubectl, kubeadm            |
| Conteneurs        | Docker, Containerd                                  |
| CI/CD             | GitHub Actions / GitLab CI / Azure DevOps           |
| Monitoring        | Prometheus, Grafana, Azure Monitor, Fluentd         |
| Sécurité          | RBAC, NetworkPolicy, Azure Key Vault, Trivy, EDR/XDR |
| Sauvegarde        | Velero, Azure Backup                                |
| Infra as Code     | Terraform, Ansible                                  |
| Load Balancing    | Azure Load Balancer, NGINX, Traefik                 |

---

> **Auteur** : Équipe Cloud & DevOps CYNA  
> **Version** : 1.2 — Dernière mise à jour : `2025-07-19`

