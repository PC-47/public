# history settings
export HISTSIZE=10000
export HISTFILESIZE=10000
export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "

# aliases
alias ll='ls -lh --color=auto'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias rs='rsync -vah --info=progress2 --no-i-r'
alias rm="rm -v"

function help {
        echo "brc           -> edit bashrc file with micro and reload"
}

# ssh aliases

# ssh tunnel and proxies

# function to update the bash prompt
update_prompt() {
    if [ $? -eq 0 ]; then
        # last command good
        export PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w \[\e[32m\]-> \[\e[0m\]'
    else
        # last command bad
        export PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w \[\e[31m\]-> \[\e[0m\]'
    fi
}

PS1='\[\e[33m\]\u \[\e[34m\]\h \[\e[35m\]\w \[\e[32m\]-> \[\e[0m\]'

# commands to be ran before displaying bash prompt
PROMPT_COMMAND='update_prompt; history -a; history -c; history -r'

# function to edit and re-source bashrc file
function brc {
        micro ~/.bashrc
        source ~/.bashrc
        echo Reloaded Bashrc
}
