alias ls="ls -G"
alias ll="ls -la"
function vmake() {
    machines="netbsd7"

    for m in ${machines}; do
        p=$(pwd | sed 's:.*/pkgsrc/::g')
        /usr/local/bin/vagrant ssh ${m} -c "cd /content/pkgsrc/$p && sudo make $@"
    done
}
