# Exemple basique avec appel externe via PowerShell
resource "null_resource" "configure_intune" {
  provisioner "local-exec" {
    command = "pwsh ./scripts/setup_intune.ps1"
  }
}
