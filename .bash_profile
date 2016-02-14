source /usr/local/git/contrib/completion/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
export PS1="🍺  \[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\$(__git_ps1) \$ "
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}\007"'
export PATH="$PATH:/usr/sbin"
export PATH="/usr/local/sbin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

alias ls='ls -GFh'
alias afk="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"
alias flushdns='sudo dscacheutil -flushcache;sudo killall -HUP mDNSResponder'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias glog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2- | tr ' ' '\n')" scp sftp ssh;

# GitHub fetch pull request via id
git-pull-pr() {
  git fetch origin pull/$1/head:pull-$1
  git checkout pull-$1
}
