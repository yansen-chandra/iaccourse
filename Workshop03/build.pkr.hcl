source digitalocean codeserver {
    api_token = "dop_v1_3726c616d7996dc8c6078967eb5ea0a3bce50835e7fbb567cc21bde93a3d4cfd"
    image = "ubuntu-20-04-x64"
    region = "sgp1"
    size = "s-1vcpu-1gb"
    ssh_username = "aipc"
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