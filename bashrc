# history settings
export HISTSIZE=
export HISTFILESIZE=
export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "

# aliases
alias ll='ls -lh'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rs='rsync -vah --info=progress2 --no-i-r'
alias rm="rm -v"

function help {
        echo "brc           -> edit bashrc file with micro and reload"
        echo "rs            -> rsync with flags for progress info"
}

# ssh aliases

# ssh tunnel and proxies

# function to update the bash prompt
# PROMPT VERSION 02
update_prompt() {
    if [ $? -eq 0 ]; then
        # last command good
        export PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w\n\[\e[32m\]\t -> \[\e[0m\]'
    else
        # last command bad
        export PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w\n\[\e[31m\]\t -> \[\e[0m\]'
    fi
}
PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w\n\[\e[32m\]\t -> \[\e[0m\]'

# commands to be ran before displaying bash prompt
PROMPT_COMMAND='update_prompt; history -a; history -c; history -r'

# function to edit and re-source bashrc file
function brc {
        micro ~/.bashrc
        source ~/.bashrc
        echo Reloaded Bashrc
}
