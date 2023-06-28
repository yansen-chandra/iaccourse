source digitalocean codeserver {
    api_token = "dop_v1_448de69aae4c5df8406eb7a52d99dc2e25eb4592365b0776fa9c546bf464915a"
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