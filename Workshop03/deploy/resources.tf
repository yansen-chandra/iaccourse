data "digitalocean_ssh_key" "aipc" {
    name = var.do_ssh_key
}

data "digitalocean_droplet_snapshot" "codeserver" {
  name  = "codeserver"
  region      = var.do_region
  most_recent = true
}

resource "digitalocean_droplet" "codeserver" {
    name = "codeserver"
    image = data.digitalocean_droplet_snapshot.codeserver.id
    region = var.do_region
    size = var.do_size

    connection {
      type = "ssh"
      user = "root"
      private_key = file(var.ssh_private_key)
      host = self.ipv4_address
    }
  
    provisioner "remote-exec" {
      inline = [ 
        "sed -i '$/__CODESERVER_PASSWORD__/${var.cs_password}' /lib/systemd/system/code-server.service",
        "sed -i '$/__DOMAIN_NAME__/${var.cs_domain}' /etc/nginx/sites-available/code-server.conf",
        "systemctl daemon-reload",
        "systemctl restart code-server",
        "systemctl restart nginx",
       ]
    }
}

output "codeserver_ip" {
  value = digitalocean_droplet.codeserver.ipv4_address
}