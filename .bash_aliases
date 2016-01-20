# vim: filetype=sh

alias tmux='TERM=screen-256color-bce tmux'

alias ussh='echo I hope you know what you are doing && ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no'
alias lock='i3lock -ti ~/wallpaper.png'

alias disk_space='du -h . 2>/dev/null | sort -rh | head -n $(expr `tput lines` - 1)'

alias vim='vim -w ~/.vimlog "$@"'
alias mkpy='cp ~/template.py $1'

alias fuck='sudo $(history -p \!\!)'
