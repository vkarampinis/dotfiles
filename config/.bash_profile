source /usr/local/git/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true

emoji="${debian_chroot:+($debian_chroot)}\$(if [ \$? == 0 ]; then echo 🍺; else echo 💥; fi) "

export PS1="${emoji}\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(__git_ps1) \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
export PATH="$PATH:/usr/sbin"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH=~/Library/Python/2.7/bin/:$PATH
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/bin:$PATH"
export PATH="/usr/local/opt/php@7.2/sbin:$PATH"
export PATH="$HOME/.fastlane/bin:$PATH"

export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin

export XDEBUG_CONFIG="idekey=VSCODE"

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source ~/.functions
source ~/.aliases


# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

 [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# fnm
eval "$(fnm env --multi)"

# Added by serverless binary installer
export PATH="$HOME/.serverless/bin:$PATH"


export PATH="/usr/local/opt/ruby/bin:$PATH"

export LDFLAGS="-L/usr/local/opt/ruby/lib"
export CPPFLAGS="-I/usr/local/opt/ruby/include"
export PKG_CONFIG_PATH="/usr/local/opt/ruby/lib/pkgconfig"
