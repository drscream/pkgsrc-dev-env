#!/usr/bin/env bash
# Switch to new pkgsrc building into my HOME

# New export PATH
export PATH=/Users/tm/pkg/sbin:/Users/tm/pkg/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
export MANPATH=/Users/tm/pkg/man:/opt/pkg/man:

# Unset some PATHs
unset GEM_PATH

# Reset alias
unalias -a
alias ls="ls -G"
alias ll="ls -la"
#
#function vmake() { p=$(pwd | sed 's:.*/pkgsrc/::g'); /usr/local/bin/vagrant ssh -c "cd /content/pkgsrc/$p && sudo make $@"; }

# Modify PS1
export PS1="{\!} \[\e[1;37m\]\w\[\033[m\]\[\e[32;1m\]$\[\033[m\] "

# Switch mode
bash --rcfile ~/pkgsrc-dev-env/home/.bashrc
