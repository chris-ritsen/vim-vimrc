alias chromium='chromium --ignore-gpu-blacklist'
alias ll='ls -la'
alias ls='ls --color=always'
alias svndiff='svn diff --diff-cmd=colordiff -x '-wp' . | lv -c'
alias tmux='tmux -u2'
alias truecrypt='truecrypt --text'
export BROWSER=chromium
export EDITOR=vim
export FIGNORE=svn
export GREP_OPTIONS="--exclude-dir=\.svn"
export HISTFILE=~/.histfile
export HISTSIZE=10000
export MYSQL_PS1="\u@\h [\d]> "
export PAGER=less
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:/home/chris/.gem/ruby/1.9.1/bin 
export PROMPT='%n@%m: %~%# '
export SAVEHIST=10000

if [ -n "$DISPLAY" ]; then
  export BROWSER='chromium'
  alias windows8='VBoxSDL --fullscreenresize --nofstoggle --nograbonclick --startvm "Windows 8"'
  alias killx='sudo killall xinit && nohup exec xinit'
fi


