# Configura o Provider Google Cloud com o Projeto
provider "google" {
  credentials = file(var.project_id_credencial)
  project     = var.project_id_provider
  region      = var.project_id_regiao
}
