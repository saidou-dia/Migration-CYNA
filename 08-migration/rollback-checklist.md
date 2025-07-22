# Checklist de Rollback Technique – Projet CYNA

Ce document détaille les étapes critiques à suivre en cas d’échec partiel ou complet de la migration vers les nouveaux environnements (Genève & Azure).

---

##  1. Détection et conditions de rollback

- [ ] Identification des échecs bloquants (accès, réseau, données corrompues).
- [ ] Documentation des erreurs techniques ou régressions.
- [ ] Validation croisée avec les équipes métier et IT.
- [ ] Déclenchement du plan de retour après validation du comité projet.

---

##  2. Rollback des postes utilisateurs

- [ ] Réactivation des anciens profils locaux (postes non supprimés).
- [ ] Bascule du DNS vers anciens serveurs / routes.
- [ ] Désactivation de la GPO/Intune appliquée post-migration.
- [ ] Vérification de l'accès aux ressources locales (on-prem).

---

##  3. Rollback des environnements Cloud

- [ ] Stop des synchronisations AD / Azure AD.
- [ ] Restauration des snapshots Azure VMs et disques.
- [ ] Restauration des données via sauvegardes (OneDrive, SharePoint).
- [ ] Reconfiguration temporaire du tunnel VPN vers infra Paris.

---

##  4. Rollback applicatif (SaaS & AKS)

- [ ] Rollback Helm charts via `helm rollback`
- [ ] Restauration des volumes avec Velero ou Kasten K10.
- [ ] Redéploiement des versions antérieures via CI/CD GitLab.
- [ ] Bascule DNS vers anciens endpoints applicatifs.

---

##  5. Rollback sécurité & supervision

- [ ] Réactivation de l’ancienne supervision Zabbix ou Prometheus sur Paris.
- [ ] Réinstallation du client EDR/XDR sur les anciens endpoints si désinstallé.
- [ ] Rétablissement des anciennes règles NSG, firewall on-prem.
- [ ] Réintégration des logs dans les anciens systèmes SIEM si nécessaires.

---

##  6. Communication & documentation

- [ ] Notification aux utilisateurs du rollback activé.
- [ ] Mise à jour du journal des incidents critiques.
- [ ] Rapport technique de rollback à rédiger.
- [ ] Retour d’expérience à planifier après stabilisation.

---

##  Équipes impliquées

| Domaine         | Responsable              |
|----------------|--------------------------|
| Infra réseau    | IT Paris / IT Genève     |
| Cloud Azure     | CloudOps                 |
| Sécurité        | SecOps / MSSP            |
| SaaS/DevOps     | DevOps                   |
| Support terrain | Helpdesk local (Paris)   |

---

>  Astuce : tous les environnements critiques doivent être préalablement **sauvegardés**, **versionnés** et **réversibles** avant chaque lot de migration.
