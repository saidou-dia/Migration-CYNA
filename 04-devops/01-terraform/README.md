# 05 - Déploiement Infrastructure avec Terraform

## Objectifs

- Déploiement automatisé de l'infrastructure cloud (Azure)
- Réutilisabilité des modules pour Genève, Paris,PCA et PRA
- Versioning, collaboration GitOps

## Environnements

- `shared/` : ressources communes (VNet, NSG, storage, identity)
- `azure/` : déploiement Azure (AKS, Bastion, AD)
- `siege_geneve/` : infrastructure hybride locale + Azure
- `filiale_paris/` : infra cloud-native + SD-WAN
- pca/ : réplication des données critiques (Azure region secondaire)
- pra/ : plan de reprise, scripts de restauration automatique, tests de bascule
- 

## À venir

- Modules `VNet`, `AKS`, `Bastion`, `VPN`, `DNS`
- Variables sensibles via Azure Key Vault
- Remote state (Terraform Cloud ou backend Azure)
