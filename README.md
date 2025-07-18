# Migration IT Paris  Genève  Azure
 
Schéma de l'infrastructure cible

Voici une vue simplifiée de l’architecture cible combinant les environnements Azure et on-premise (Genève et Paris ).

![Schéma de l’infrastructure cible](./00-docs/infra/schema_azure_paris_geneve.png)

>  Le schéma inclut :  
> - Lien VPN Site-to-Site entre Paris et Genève  
> - Peering avec le tenant Azure central  
> - Bastion, AKS, Azure AD, et intégration Zscaler  
> - Redondance PCA/PRA entre régions Azure  


+---------------------+          Connexion S2S + Zscaler         +------------------+        
|     Filiale Paris   |  --------------------------------------> |     Siège Genève |
|  Apps, fichiers, AD |                                         |    Hub réseau     |
+---------------------+                                         |    AKS + Bastion  |
                                                              +------------------+
                                    |
                                    | Peering / Gateway VPN
                                    v
                              +------------+
                              | Microsoft  |
                              |   Azure    |
                              +------------+

<img width="921" height="567" alt="schema_azure_paris_geneve" src="https://github.com/user-attachments/assets/6660ba91-bd6d-4748-b5bb-6ef4c7ce19bc" />



