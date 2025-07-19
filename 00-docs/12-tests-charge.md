# 12. - Tests de Charge

## 1. Objectif des Tests de Charge

L’objectif de ces tests est de vérifier la capacité de l’infrastructure et des applications migrées vers Azure à supporter une charge utilisateur conforme aux attentes métiers, tout en garantissant performance, stabilité et disponibilité.

---

## 2. Contexte

Dans le cadre de la migration du système entre les sites de Paris et Genève vers une plateforme cloud Azure, il est crucial de réaliser des tests de charge pour :  
- Valider la scalabilité des applications.  
- Identifier les points de contention potentiels.  
- Vérifier la gestion des pics de trafic.  
- S’assurer du respect des niveaux de service (SLA).

---

## 3. Environnement de Test

- **Infrastructure cible** : Azure (machines virtuelles, services PaaS, bases de données, etc.)  
- **Applications testées** : [Liste des applications concernées]  --------------------------------------------------------> a lister
- **Outils utilisés** :  
  - Azure Load Testing  
  - Apache JMeter  
  - Gatling  
  - Autres (à spécifier)

---

## 4. Scénarios de Test

### 4.1 Scénario 1 : Charge nominale (80 utilisateurs)

- **Description** : Simulation d’un nombre moyen d’utilisateurs simultanés (80 utilisateurs)
- **Objectifs** : Vérifier la stabilité, le temps de réponse, et l'utilisation normale des ressources en situation courante.

### 4.2 Scénario 2 : Charge réelle actuelle (200 utilisateurs)

- **Description** : Simulation du nombre réel de collaborateurs connectés simultanément
- **Objectifs** : Valider la performance actuelle de l’environnement Azure pour les besoins réels de l’entreprise.

### 4.3 Scénario 3 : Stress test (500 utilisateurs simulés)

- **Description** : Simulation d’un pic de charge avec 500 utilisateurs (au-delà de la capacité actuelle)
- **Objectifs** : Identifier les limites de scalabilité, les points de rupture, et vérifier les mécanismes d’auto-scaling ou de résilience.

---

## 5. Méthodologie

- Préparation des scripts de test (scénarios utilisateurs, transactions critiques)  
- Définition des indicateurs clés de performance (KPI) :  
  - Temps de réponse moyen et 95ème percentile  
  - Taux d’erreur  
  - Utilisation CPU, mémoire, bande passante  
  - Disponibilité du service  
- Exécution des tests sur des fenêtres horaires définies  
- Collecte et analyse des résultats  
- Identification des anomalies et recommandations

---

## 6. Critères de Réussite

| KPI                     | Seuil attendu                   | Commentaire                        |
|------------------------|----------------------------------|------------------------------------|
| Temps de réponse moyen | < 2 secondes                    | Pour les transactions critiques    |
| Taux d’erreur          | < 1%                            | Incluant timeout et erreurs HTTP   |
| Disponibilité          | ≥ 99,9 %                        | Pendant toute la durée des tests   |
| Utilisation CPU        | < 85 %                          | Afin d’éviter saturation           |
| Mémoire utilisée       | < 80 %                          | Pour garantir la stabilité système |

---

## 7. Résultats Attendus

- Validation de la capacité de l’infrastructure Azure à supporter les charges prévues  
- Recommandations sur les ajustements éventuels (scaling, optimisation, configuration réseau)  
- Rapport complet de tests avec graphiques et logs

---

## 8. Annexes

- Liens vers scripts JMeter / Azure Load Testing  
- Configuration des environnements  
- Documentation technique des outils  
- Logs et rapports détaillés des tests

---

*Document rédigé par : DIA Saidou
*Date : 19/07/2025
*Version : 1.0*
