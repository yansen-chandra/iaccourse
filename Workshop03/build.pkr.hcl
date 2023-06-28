variable "do_token" {
    default = env("DO_PAT")
}

source digitalocean codeserver {
    api_token = var.do_token
    image = "ubuntu-20-04-x64"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    ssh_username = "root"
    snapshot_name = "codeserver" 
}
build {
    sources = [
        "source.digitalocean.codeserver"
    ]
    provisioner ansible {
        playbook_file = "playbook.yaml"
        ansible_ssh_extra_args = [
            "-oHostKeyAlgorithms=+ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa"
        ]
    }
}