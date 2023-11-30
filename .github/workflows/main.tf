provider "github" {
  token = "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"
}

variable "nom_du_repo" {
  description = "Nom du dépôt GitHub"
  type        = string
}

resource "github_repository" "mon_repo" {
  name        = var.nom_du_repo
  description = "Créé avec Terraform"
  private     = true
}