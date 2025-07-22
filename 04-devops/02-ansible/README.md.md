# Automatisation avec Ansible

## 1. Objectifs
- Automatiser la configuration des serveurs Linux dans les différents sites (Genève, Paris).
- Déployer et configurer les agents de sécurité (EDR, XDR).
- Automatiser la mise en place du MFA Zscaler.
- Standardiser les configurations applicatives et systèmes.
- Faciliter la répétabilité et la montée en charge des déploiements.

## 2. Architecture Ansible
- Inventaires organisés par site et type de serveur :
  - `inventory/siege_geneve/`
  - `inventory/filiale_paris/`
- Playbooks segmentés par fonction :
  - `playbooks/hardening/` : durcissement sécurité
  - `playbooks/mfa_zscaler.yml` : déploiement MFA Zscaler
  - `playbooks/siem_agents.yml` : déploiement agents SIEM
  - `playbooks/apps_config.yml` : configuration applicative

## 3. Description des playbooks principaux

### 3.1 Durcissement (hardening)
- Application de règles de sécurité Linux (firewall, SSH, utilisateurs).
- Mise à jour des paquets critiques.
- Configuration des journaux système.

### 3.2 MFA Zscaler
- Installation et configuration des agents MFA.
- Intégration avec les serveurs d’authentification.

### 3.3 Agents SIEM
- Déploiement des agents pour collecte des logs (ex: Splunk Forwarder).
- Configuration pour transmission sécurisée des données.

### 3.4 Configuration applicative
- Déploiement des paramètres et variables d’environnement.
- Installation des dépendances et services requis.

## 4. Processus de déploiement
- Validation en environnement de test.
- Exécution des playbooks via pipeline CI/CD (GitLab/Jenkins).
- Monitoring et reporting des déploiements.

## 5. Perspectives
- Extension vers la gestion des configurations Windows.
- Automatisation des mises à jour de sécurité.
- Intégration avec Terraform pour provisionnement complet.

---

*Ce document décrit l’approche Ansible pour la standardisation et l’automatisation dans le cadre de la migration CYNA.*
