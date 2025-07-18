# Filiale Paris – Infrastructure et contexte

## Présentation

La filiale Paris est un site stratégique du groupe, avec une infrastructure IT majoritairement on-premise, qui doit être migrée vers Azure dans le cadre du projet global.

---

## Architecture actuelle

- **Localisation** : Paris, France  
- **Surface datacenter** : xx m²  
- **Équipements principaux** :  
  - Serveurs physiques (marques/modèles)  
  - Switchs, routeurs, firewall (marques/modèles)  
  - Baies de stockage SAN/NAS  
  - Système de sauvegarde local  

---

## Réseau

- Réseau local (LAN) segmenté en VLANs (ex : production, management, WiFi invités)  
- Connexion VPN sécurisée vers siège Genève (Site-to-Site IPsec)  
- Connexion Internet dédiée avec firewall UTM

---

## Services et applications clés

- Serveurs applicatifs métier  
- Bases de données (SQL Server, Oracle, etc.)  
- Services d’annuaire locaux (AD)  
- Serveurs de fichiers, impression, messagerie interne

---

## Objectifs de migration

- Migrer les workloads critiques vers Azure (IaaS/PaaS)  
- Mettre en place une architecture hybride (on-prem + cloud)  
- Moderniser la gestion des identités via Azure AD  
- Assurer la continuité et la sécurité des services pendant la migration

---

## Schéma de l’infrastructure Paris

<img width="503" height="607" alt="schema_paris" src="https://github.com/user-attachments/assets/965ed86c-b199-416e-8e5b-ceea13015709" />


---

## Conclusion

La filiale Paris joue un rôle pivot dans la migration, nécessitant une coordination précise pour minimiser les interruptions et garantir la performance post-migration.
