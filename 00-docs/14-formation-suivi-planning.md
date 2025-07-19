# 14. Formation des équipes internes & Suivi post-déploiement

## Formation des équipes internes

Objectif : S’assurer que les équipes locales (Paris et Genève) sont autonomes dans l’exploitation post-migration.

### Thèmes de formation :
- Prise en main d’Azure Portal, Azure Monitor, Log Analytics
- Utilisation de Terraform et Ansible (lecture, exécution des playbooks)
- Supervision avec Prometheus / Grafana
- Procédures de sauvegarde et restauration
- Accès aux VMs via Bastion ou VPN
- Escalade des incidents et bonnes pratiques d’exploitation

### Format :
- Sessions en visio + replay
- Livrets PDF par thème
- QCM de validation (facultatif)
- Support technique dédié pendant 1 mois post-migration

---

## Suivi post-déploiement

Période de supervision renforcée : **30 jours** après la mise en production.

### Actions :
- Monitoring en temps réel des services critiques
- Support L2/L3 disponible en H+1
- Rapports hebdomadaires d'incidents & métriques clés
- Points hebdomadaires avec le client IT
- Mises à jour correctives des scripts ou de la config (si besoin)

---

##  Planning & Diagramme de Gantt (indicatif)

| Phase                        | Durée       | Ressources              | Remarques                                 |
|-----------------------------|-------------|--------------------------|-------------------------------------------|
| Analyse post-migration      | 2 jours     | Architecte + Ops         | Vérification de la cohérence des données  |
| Formation équipes Paris     | 2 jours     | Formateur + Référents    | Sessions enregistrées                     |
| Formation équipes Genève    | 2 jours     | Formateur + Référents    | Sessions en décalé                        |
| Supervision renforcée       | 30 jours    | Support N2/N3            | Support à chaud, corrections si besoin    |
| Rapport final et clôture    | 2 jours     | Chef de projet           | Inclut feedback client                    |

> **Note** : Les plages de formation seront planifiées en dehors des heures d’exploitation critique.

---

## Contraintes spécifiques

- **Minimisation des interruptions** : toutes les opérations critiques seront faites pendant les fenêtres de maintenance (soir/nuit).
- **Synchronisation des ressources humaines** : implication coordonnée entre Paris et Genève pour garantir la continuité de service.
- **Validation client obligatoire** à chaque fin de phase avant passage à la suivante.

---

*Document maintenu par : DIA Saidou
*Version : 1.0*  
*Dernière mise à jour : 19/07/2025
