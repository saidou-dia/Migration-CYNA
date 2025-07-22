# Filiale Paris – Infrastructure et rôle dans la migration

## Présentation

La filiale Paris agit principalement comme un point d’accès réseau pour les utilisateurs, qui se connectent aux services hébergés au siège de Genève. L’infrastructure locale est donc principalement dédiée à la connectivité et au support réseau.

---

## Architecture actuelle

- **Localisation** : Paris, France  
- **Rôle principal** : Point d’accès réseau pour les utilisateurs locaux  
- **Infrastructure** :  
  - Équipements réseau (switchs, firewall, routeurs) assurant la connectivité  
  - Pas de serveurs critiques hébergés localement  
  - Connexion VPN sécurisée vers le siège Genève  

---

## Réseau

- Réseau local (LAN) optimisé pour la connectivité des utilisateurs  
- VPN site-à-site avec Genève pour accès aux applications et services  
- Accès internet sécurisé via firewall local  

---

## Objectifs de migration

- Garantir une continuité parfaite de la connectivité réseau pendant et après la migration  
- Simplifier la gestion réseau via l’intégration avec Azure Networking (VPN, VNet)  
- Assurer la sécurité des communications entre Paris et Genève via des solutions Zero Trust  

---

## Schéma simplifié de l’infrastructure réseau Paris

---

## Schéma de l’infrastructure Paris

<img width="503" height="607" alt="schema_paris" src="https://github.com/user-attachments/assets/965ed86c-b199-416e-8e5b-ceea13015709" />


---

## Conclusion

La filiale Paris joue un rôle clé dans la connectivité utilisateur, permettant l’accès aux services hébergés principalement à Genève et dans Azure. 
La migration prévoit de maintenir et renforcer cette connectivité dans un environnement hybride sécurisé.
