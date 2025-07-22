# Connectivité entre les sites Paris, Genève et Microsoft Azure

## Objectif

Assurer une connexion sécurisée, fiable et performante entre la filiale Paris, le siège à Genève et l’environnement cloud Azure, garantissant la continuité des services et une intégration fluide hybride.

---

## Architecture réseau

- **VPN Site-to-Site (S2S) entre Paris et Genève**  
  Une connexion VPN IPsec est configurée entre le firewall du siège à Genève et celui de la filiale Paris, assurant un tunnel sécurisé pour le trafic inter-sites.

- **Azure VPN Gateway**  
  La passerelle VPN Azure connecte l’infrastructure on-premise au cloud, permettant l’intégration des Virtual Networks Azure (VNet) avec les sites physiques.

- **Peering entre Virtual Networks (VNet)**  
  Les réseaux virtuels Azure des différentes régions (Genève, Paris) sont reliés via peering, garantissant une communication optimisée et faible latence dans le cloud.

---

## Protocoles et Sécurité

- **Protocoles utilisés** :  
  - IPsec/IKEv2 pour les tunnels VPN.  
  - BGP (Border Gateway Protocol) pour le routage dynamique entre sites on-premise et Azure.

- **Chiffrement** :  
  AES 256 bits pour sécuriser les données en transit.

- **Firewall et règles d’accès** :  
  Politiques restrictives appliquées sur les firewalls on-prem et Azure pour limiter les flux aux seuls services nécessaires.

- **Authentification** :  
  Utilisation de certificats et clés pré-partagées (PSK) pour valider les connexions VPN.

---

## Performances et Redondance

- **Bande passante** :  
  Connexions dimensionnées selon les besoins métier, avec monitoring continu pour anticiper les pics de charge.

- **Haute disponibilité** :  
  Mise en place de liens secondaires en secours en cas de défaillance du lien principal.

- **Qualité de service (QoS)** :  
  Priorisation du trafic critique (applications métier, VoIP) pour garantir la performance.

---

## Supervision et Maintenance

- Surveillance des tunnels VPN et performances via Azure Monitor et outils internes.  
- Alertes configurées en cas de perte de connectivité ou dégradation.  
- Processus de maintenance planifiée pour mises à jour et tests de bascule.

---

## Références

- Voir `02-reseau-connectivite.md` pour détails techniques approfondis.  
- Voir `05-terraform.md` pour les scripts de déploiement des ressources réseau Azure.

---

## Conclusion

Une connectivité sécurisée et optimisée entre Paris, Genève et Azure est essentielle pour la réussite de la migration et la continuité des activités.

