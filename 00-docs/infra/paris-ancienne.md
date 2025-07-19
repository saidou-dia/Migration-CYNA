# État Initial – Site de Paris (avant déménagement)

Ce document présente une synthèse de l'organisation, des enjeux métiers, de l'infrastructure actuelle et des contraintes techniques du site de Paris, avant sa fermeture progressive et la migration vers la nouvelle architecture cible.

---

## 1. Métiers et Enjeux

### Activités stratégiques
- **Gestion du SOC** (Security Operations Center) des clients
- **Gestion des solutions EDR/XDR**
- Activités support classiques : **Ressources Humaines**, **Finance**, **Administration**

### Clients
- Tous secteurs confondus
- Couverture géographique : **clientèle européenne**
- Chaque client est considéré comme **prioritaire**

### Organisation
- Présence de **toutes les équipes techniques** et de **la direction**
- Seuls les **commerciaux** et un **spécialiste métier** sont physiquement sur site

### Organigramme simplifié
- Direction Générale
- Direction Commerciale
- Direction des Ressources Humaines
- Direction Technique

### Collaboration IT ↔ Métiers
- **Imbrication forte** des équipes techniques et métiers
- Existence de **référents fonctionnels** en lien direct avec les clients
- **Coordinateurs techniques** identifiés par projet

### Priorités SI
- **Sécurité** (intégrité, fiabilité)
- **Performance**, notamment du SOC
- **Maîtrise des coûts**
- **Mobilité** et **conformité** mentionnées, mais secondaires

### Services critiques
- Plateformes de **gestion de la sécurité** des infrastructures et des données clients
- Services SaaS internes (SOC, outils EDR/XDR)

---

## 2. Logistique, Organisation & Support

### Gestion du SI
- Gérée par une **DSI structurée par pôles** :
  - Développement
  - Qualification et validation
  - Production

### Organisation IT
- **Modèle hybride**
  - Développeurs : **majoritairement externes**
  - Support/MCO infra : **partiellement externalisé**

### Prise de décision
- En cas d’incident : escalade **administrateur → responsable → DSI**
- Cellule de crise mise en place lors d’incidents majeurs

---

## 3. Infrastructure Technique Actuelle

### Hébergement
- **100 % on-premise**
- Aucun hébergement cloud à ce jour

### Outils et logiciels
- SOC, EDR/XDR considérés comme **indispensables**
- Pas d’intégration MFA, SSO, ni d’Intune
- Authentification uniquement via **Active Directory classique**

### Accès utilisateur
- **Accès selon le profil (sédentaire / télétravailleur)**
- Pas de VPN, MFA, ni d’accès conditionnel

### Contraintes techniques
- **Performances parfois dégradées**
- **Exposition aux attaques**
- Pas d’automatisation de sauvegardes / supervision
- **Pas de plan de continuité ni PRA formel**

---

## 4. Inventaire et Migration

### Matériel à déménager
- **Tout doit être déménagé** (routeurs, switches, postes, etc.)
- Le site de Paris ne conservera que **2 bureaux** (postes restants limités)

### Volumétrie
- Données à migrer : **environ 20 To**
- Serveurs et postes à inventorier
- **Aucune cartographie d’adresses IP** (publiques/privées) actuellement disponible

---

## 5. Enjeux pour la future architecture

- Déploiement d’une **infrastructure hybride Azure + VPN S2S**
- **Standardisation** des outils et des accès (MFA, SSO, Intune, Defender)
- **Supervision centralisée** (Sentinel, Nexthink)
- **Mise en conformité** avec la stratégie sécurité groupe (Zero Trust, EDR/XDR, segmentation)
