terraform {
  required_providers {
    vultr = {
      source = "vultr/vultr"
      version = "2.17.1"
    }
  }
}


provider "vultr" {
  api_key = "SILLVA2A6J3F6S4SKKSNXAPFNZFMWNFF2MRA"
}

resource "vultr_instance" "test" {
  label	     = "VM_maxime"
  plan             = "vc2-1c-1gb"
  region           = "fra"
  os_id            = 167
  enable_ipv6      = true

  user_data = <<-EOT
              #!/bin/bash
              # Mise à jour des paquets
              apt-get update -y
              # Installation de Docker
              curl -fsSL https://get.docker.com -o get-docker.sh
              sh get-docker.sh
              # Ajout de l'utilisateur actuel au groupe Docker
              usermod -aG docker $USER
              # Démarrage de Docker
              systemctl start docker
              # Activation de Docker au démarrage
              systemctl enable docker
	      docker run -d -p 80:80 -e node=Server  jialezi/html5-speedtest
              EOT
}

output "instance_ip" {
  value = vultr_instance.test.main_ip
}