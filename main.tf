# Cria uma VM com o Google Cloud
resource "google_compute_instance" "helloworld" {
  name         = "blog"
  machine_type = "f1-micro"
  zone         = var.project_id_cidade

  # Defini a Imagem da VM
  boot_disk {
    initialize_params {
      image = "ubuntu-1804-bionic-v20191113"
    }
  }

  # Habilita rede para a VM com um IP público
  network_interface {
    network = var.project_id_rede
    access_config {
    }
  }
}


# Cria SQL Gerenciado com Engine MySQL 
resource "google_sql_database_instance" "helloworld" {
  name             = "database"
  database_version = "MYSQL_5_7"
  region           = "us-central1"

  settings {
    tier = var.project_id_tier
  }
}

# Retorna o IP da VM criada
output "IP_da_VM" {
  value = "${google_compute_instance.helloworld.network_interface.0.access_config.0.nat_ip}"
}
