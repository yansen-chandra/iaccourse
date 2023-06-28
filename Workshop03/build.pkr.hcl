source digitalocean codeserver {
    api_token = "dop_v1_8c33eb8fa2f1280d23f687251562a7e9be657d804d1d222d81bb3983d889409c"
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