# Quickly pass commands to Homestead vagrant box
function homestead() {
    ( cd ~/Homestead && vagrant $* )
}

# Homestead shortcut
alias hs=homestead

## SSH to Homestead, starting the VM if necessary
function hssh() {
    (
        cd ~/Homestead
        RUNNING=$(vagrant status --machine-readable | grep state,running)
        if [[ -z $RUNNING  ]]; then
            vagrant up
        fi
        vagrant ssh
    )
}
