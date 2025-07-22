# 01 - Architecture cible de l’environnement IT Paris → Genève + Azure

## 1. Contexte général

La société Cyna, spécialisée dans la cybersécurité (SOC, EDR/XDR), centralisait jusqu’ici son infrastructure IT on-premise à Paris. Le projet consiste à migrer cette infrastructure vers :
- une nouvelle implantation à **Genève (on-premise)**,
- et une infrastructure **cloud (Azure)** pour assurer haute disponibilité, scalabilité et sécurité.

## 2. Objectifs de l’architecture

- Renforcer la **résilience** et la **sécurité** des environnements IT.
- Garantir la **performance** du SOC et des outils critiques (EDR/XDR).
- Réduire la dépendance à un seul site physique (Paris).
- Intégrer progressivement des outils modernes (Ansible, Terraform, Kubernetes, etc.).

## 3. Architecture cible

### 3.1 Schéma global (Genève + Azure)

- **On-premise Genève** :
  - SOC redéployé en interne
  - Supervision réseau
  - Accès local sécurisé (physique et logique)

- **Azure (France Central / Switzerland North)** :
  - VNet principal avec sous-réseaux pour :
    - Bastion / JumpBox
    - AKS (Kubernetes)
    - VM applicatives
    - Réplication SOC/EDR
  - Services managés :
    - Azure AD (hybride avec AD local)
    - Backup + Monitoring
    - MFA / Zscaler / Intune

> Voir détails dans `00-docs/infra/infra-cible.md` et `azure.md`.

### 3.2 Connectivité et sécurité

- VPN site-à-site Paris → Genève → Azure
- Sécurisation Zero Trust + segmentation réseau
- Accès par Azure Bastion / MFA à terme

## 4. Migration depuis Paris

- Création d’une infrastructure neuve à Genève (on-premise), conçue selon les meilleures pratiques actuelles.
-Pas de déménagement physique des équipements : les serveurs et matériels restent à Paris ou sont remplacés par du neuf à Genève
- Redéploiement des services critiques (SOC, EDR) sur la nouvelle infra genevoise.
- Basculement des applications utilisateurs vers Azure pour scalabilité et modernisation.
- Refonte des accès utilisateurs :
  - Centralisation sur Azure AD (hybride).
  - Mise en place progressive de SSO/MFA

## 5. Contraintes et points de vigilance

- Pas d’ExpressRoute → tout repose sur des tunnels VPN/IPSec ce qui peut limiter la bande passante et la latence.
- Performance dégradée actuellement à Paris
- Pas de MFA/SSO encore en place → ajout dans le planning cible
- 20 To de données à migrer (cf. planning détaillé)

## 6. Évolutivité

- Déploiement de pipelines CI/CD (GitLab, Jenkins)
- Supervision via Prometheus/Grafana
- Possibilité d’intégrer DRaaS ou services managés futurs

---
Pour le détail des schémas d’architecture et d’infrastructure, se référer aux documents situés dans 00-docs/infra/
