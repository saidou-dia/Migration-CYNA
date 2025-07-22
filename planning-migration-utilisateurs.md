#  Planning de Migration – Utilisateurs & Services – Projet CYNA

Ce document présente le planning détaillé de la migration des utilisateurs, par lot et par service, de Paris vers Genève et Azure.  
L’objectif est d’assurer une migration progressive, contrôlée, et réversible à tout moment.

---

##  Principes de migration

- Migration **par service**, en **lots de 20 à 30 utilisateurs**.
- Chaque migration est précédée d’un **audit**, d’un **test de connectivité**, et d’un **snapshot** des données utilisateurs.
- Migration uniquement après validation de l’environnement cible (Genève / Azure).
- Support technique renforcé les jours de migration.

---

##  Phases clés

| Phase        | Activités                                   | Dates prévisionnelles     | Responsable         |
|--------------|---------------------------------------------|----------------------------|----------------------|
| Préparation  | Audit des comptes & données OneDrive        | 1 – 5 octobre 2025         | IT Paris             |
|              | Communication interne                       | 3 octobre 2025             | RH / DSI             |
|              | Snapshots & sauvegardes locales             | 4 – 6 octobre 2025         | CloudOps             |
| Lot 1        | Migration Direction Générale (10 pers.)     | 7 octobre 2025             | IT Paris/Genève      |
| Lot 2        | RH & Finance (20 pers.)                     | 8 – 9 octobre 2025         | IT Paris/Genève      |
| Lot 3        | Équipe SOC / SecOps (30 pers.)              | 10 – 11 octobre 2025       | SecOps               |
| Lot 4        | Équipe DevOps + CloudOps (25 pers.)         | 14 – 15 octobre 2025       | DevOps / CloudOps    |
| Lot 5        | Équipe commerciale (30 pers.)               | 16 – 17 octobre 2025       | IT Paris / RH        |
| Lot 6        | Support technique & Helpdesk (15 pers.)     | 18 octobre 2025            | Support / IT         |
| Buffer       | Reprise des cas problématiques              | 21 – 23 octobre 2025       | IT + Migration Team  |
| Validation   | Audit post-migration complet                | 24 – 25 octobre 2025       | IT Genève            |
| Clôture      | Validation finale de bascule                | 28 octobre 2025            | DSI / IT Genève      |


## Processus de migration par lot

1. **Préparation des utilisateurs** : communication des dates, consignes, sauvegardes.
2. **Snapshot & sauvegarde** : prise d’images instantanées des données et profils.
3. **Migration technique** : transfert des profils, données, et configurations.
4. **Tests post-migration** : validation des accès, applications, et performances.
5. **Support renforcé** : assistance dédiée pour résoudre rapidement les incidents.
6. **Validation finale** : confirmation de la réussite et passage au lot suivant.

---

## Équipes impliquées

| Domaine         | Responsables            |
|-----------------|------------------------|
| Infrastructure  | IT Genève              |
| Cloud & Azure   | CloudOps               |
| Sécurité        | SecOps / MSSP          |
| Déploiement     | DevOps / IT Paris      |
| Support         | Helpdesk Paris & Genève|

---

> 💡 **Note** : ce planning est évolutif et sera ajusté en fonction des retours terrains et des contraintes opérationnelles.

---
---
## Version 2 – Tableau à compléter par le client

Ce tableau est destiné à être rempli une fois que les équipes client auront précisé les services, responsables et volumes exacts par lot.

| Lot | Service / Équipe        | Nombre d'utilisateurs | Responsable | Date de migration prévue |
|-----|-------------------------|------------------------|-------------|---------------------------|
| 1   |                         |                        |             |                           |
| 2   |                         |                        |             |                           |
| 3   |                         |                        |             |                           |
| 4   |                         |                        |             |                           |
| 5   |                         |                        |             |                           |
| 6   |                         |                        |             |                           |


##  Objectifs post-migration par lot

- Données personnelles et OneDrive restaurées sans perte
- Accès aux ressources internes (VPN / SaaS / Azure)
- Authentification SSO opérationnelle
- Clients EDR/XDR actifs sur chaque poste
- Vérification de l’inventaire Nexthink (postes en conformité)

---

##  Points de vigilance

- Tests MFA et accès M365 avant bascule
- Sauvegarde OneDrive & profils utilisateurs
- Coordination avec le support pour accompagnement local
- Rollback possible via snapshot jusqu’à J+2

---

>  Ce planning est ajustable selon contraintes terrain. Chaque lot devra fournir un feedback de migration dans l’heure suivant la validation finale.
