#!/bin/zsh
bindkey -e

autoload -U compinit
compinit

autoload -U edit-command-line
zle -N edit-command-line

bindkey "\eOF" end-of-line
bindkey "\eOF" end-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOH" beginning-of-line
bindkey "\eOc" emacs-forward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e[1~" beginning-of-line # Home
bindkey "\e[2~" quoted-insert # Ins
bindkey "\e[3~" delete-char # Del
bindkey "\e[3~" delete-char # Del
bindkey "\e[4~" end-of-line # End
bindkey "\e[5C" forward-word
bindkey "\e[5D" backward-word
bindkey "\e[5~" beginning-of-history # PageUp
bindkey "\e[6~" end-of-history # PageDown
bindkey "\e[7~" beginning-of-line # Home
bindkey "\e[8~" end-of-line # End
bindkey "\e[F" end-of-line
bindkey "\e[H" beginning-of-line
bindkey "\e[Z" reverse-menu-complete # Shift+Tab
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line
bindkey '^x^e' edit-command-line
bindkey '^xe' edit-command-line
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
zstyle ':completion:*:man:*'      menu yes select
zstyle ':completion:*:manuals'    separate-sections true
zstyle ':completion:*:manuals.*'  insert-sections   true

# export http_proxy=http://localhost:3128/
# export https_proxy=http://localhost:3128/
# export ftp_proxy=http://localhost:3128/
# export no_proxy="localhost,127.0.0.1,localaddress,.localdomain.com"

