# Script de restauration d'un contrôleur de domaine Active Directory
Write-Host "Démarrage de la restauration Active Directory..."
ntdsutil "activate instance ntds" "authoritative restore" "restore subtree ou=Utilisateurs,dc=cyna,dc=local" quit quit
Write-Host "Restauration terminée. Redémarrez le serveur."