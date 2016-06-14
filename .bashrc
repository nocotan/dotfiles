# alias
alias pbcopy='xsel --clipboard --input'
alias df='df -h'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gia='git add .'
alias gic='git commit -m'
alias gip='git push origin master'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
alias g++='g++ -std=c++11'

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

case $- in
    *i*) ;;
      *) return;;
esac
HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=1000
HISTFILESIZE=2000

shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
case "$TERM" in
xterm*|rxvt*)
    ;;
*)
    ;;
esac
PS1='\[\e[0;34m\]\u\[\e[m\] \[\e[m\]\w\[\e[m\] \[\e[0;32m\]\$\[\e[m\] \[\e[0;37m\]'


if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# pip install dir
export PYTHONPATH=$HOME/local/lib/python3.4/site-packages:$PYTHONPATH
export PYTHONPATH=$HOME/local/lib/python2.7/site-packages:$PYTHONPATH

# gem install dir
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH=$HOME/.gem/ruby/2.3.0/bin:$PATH
eval "$(rbenv init -)"

# ant
ANT_ROOT=/usr/bin/ant
export ANT_ROOT

# android sdk
ANDROID_SDK_ROOT=~/home/noco/Android
export ANDROID_SDK_ROOT


txtblk='\e[0;30m' # Black - Regular
txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
txtylw='\e[0;33m' # Yellow
txtblu='\e[0;34m' # Blue
txtpur='\e[0;35m' # Purple
txtcyn='\e[0;36m' # Cyan
txtwht='\e[0;37m' # White
bldblk='\e[1;30m' # Black - Bold
bldred='\e[1;31m' # Red
bldgrn='\e[1;32m' # Green
bldylw='\e[1;33m' # Yellow
bldblu='\e[1;34m' # Blue
bldpur='\e[1;35m' # Purple
bldcyn='\e[1;36m' # Cyan
bldwht='\e[1;37m' # White
unkblk='\e[4;30m' # Black - Underline
undred='\e[4;31m' # Red
undgrn='\e[4;32m' # Green
undylw='\e[4;33m' # Yellow
undblu='\e[4;34m' # Blue
undpur='\e[4;35m' # Purple
undcyn='\e[4;36m' # Cyan
undwht='\e[4;37m' # White
bakblk='\e[40m'   # Black - Background
bakred='\e[41m'   # Red
bakgrn='\e[42m'   # Green
bakylw='\e[43m'   # Yellow
bakblu='\e[44m'   # Blue
bakpur='\e[45m'   # Purple
bakcyn='\e[46m'   # Cyan
bakwht='\e[47m'   # White
txtrst='\e[0m'    # Text Reset
export CPLUS_INCLUDE_PATH=/home/noco/.rbenv/shims:/home/noco/.gem/ruby/2.3.0/bin:/home/noco/.rbenv/bin:/home/noco/.pyenv/shims:/home/noco/.pyenv/bin::/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/usr/include/pgsql:/usr/include/pgsql/server
export C_INCLUDE_PATH=/home/noco/Github/cocos2d-x/templates:/home/noco/Github:/home/noco/Github/cocos2d-x/tools/cocos2d-console/bin:/home/noco/.rbenv/shims:/home/noco/.gem/ruby/2.3.0/bin:/home/noco/.rbenv/bin:/home/noco/.pyenv/shims:/home/noco/.pyenv/bin:/home/noco/Github/cocos2d-x/templates:/home/noco/Github:/home/noco/Github/cocos2d-x/tools/cocos2d-console/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/usr/include/pgsql/server
export CPATH=/home/noco/Github/cocos2d-x/templates:/home/noco/Github:/home/noco/Github/cocos2d-x/tools/cocos2d-console/bin:/home/noco/.rbenv/shims:/home/noco/.gem/ruby/2.3.0/bin:/home/noco/.rbenv/bin:/home/noco/.pyenv/shims:/home/noco/.pyenv/bin:/home/noco/Github/cocos2d-x/templates:/home/noco/Github:/home/noco/Github/cocos2d-x/tools/cocos2d-console/bin:/usr/local/bin:/usr/bin:/bin:/usr/bin/X11:/usr/games:/usr/include/pgsql/server
