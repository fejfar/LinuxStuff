# enable color support of ls and also add handy aliases
#if [ "$TERM" != "dumb" ]; then
#   eval "`dircolors -b`"
#   alias ls='ls --color=auto'
#   alias dir='ls --color=auto --format=vertical'
#   alias vdir='ls --color=auto --format=long'
#fi

alias l='ls -lah'

# 1)

PS1='\[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[m\]\[\e[1;32m\]\$ \[\e[m\]\[\e[1;37m\] '

# 2)

# PS1='\[\e[0;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[0;31m\]\$
# \[\e[m\]\[\e[0;32m\] '

# 3)

# PS1='\[\033[1;33m\]\u\[\033[1;37m\]@\[\033[1;32m\]\h\[\033[1;37m\]:\[\033[1;31m\]\w \[\033[1;36m\]\$ \[\033[0m\]'

alias ls='ls --color=tty -F -b -T 0'


# Eternal Aliases
alias tomcatstart='~/devEnvironment/apache-tomcat-7.0.57/bin/startup.sh && tail -f ~/devEnvironment/apache-tomcat-7.0.57/logs/catalina.out &'
alias tomcatshut='~/devEnvironment/apache-tomcat-7.0.57/bin/shutdown.sh && pkill tail'
alias tomcatreset='tomcatshut && tomcatstart'
alias connectMySql='mysql -h localhost -u root -p'

# Volatile Aliases
alias deploy='cp -v ~/workspace/accountAndEntryWebService/accountAndEntryWebService/target/accountAndEntryWebService.war ~/devEnvironment/apache-tomcat-7.0.57/webapps/ && echo ******DEPLOYED! && tomcatreset'
alias build='mvn -e clean install -DskipTests'



# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
  debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
  xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
  if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    # We have color support; assume it's compliant with Ecma-48
    # (ISO/IEC-6429). (Lack of such support is extremely rare, and such
    # a case would tend to support setf rather than setaf.)
    color_prompt=yes
  else
    color_prompt=
  fi
fi

#if [ "$color_prompt" = yes ]; then
#    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
#    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
  xterm*|rxvt*)
  PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
  ;;
  *)
  ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
  # test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  eval `dircolors`
  LS_COLORS="$LS_COLORS*.JPG=01;35:*.GIF=01;35:*.jpg=01;35:*.gif=01;35:*.jpeg=01;35:*.pcx=01;35:*.png=01;35:*.pnm=01;35:*.bz2=01;31:*.mpg=01;38:*.mpeg=01;38:*.MPG=01;38:*.MPEG=01;38:*.m4v=01;038:*.mp4=01;038:*.swf=01;038:*.avi=01;38:*.AVI=01;38:*.wmv=01;38:*.WMV=01;38:*.asf=01;38:*.ASF=01;38:*.mov=01;38:*.MOV=01;38:*.mp3=01;39:*.ogg=01;39:*.MP3=01;39:*.Mp3=01;39"

  export LS_OPTIONS='--color=auto'

  alias ls='ls $LS_OPTIONS'
  alias grep='grep $LS_OPTIONS'
  alias fgrep='fgrep $LS_OPTIONS'
  alias egrep='egrep $LS_OPTIONS'
  alias ll='ls -lF'
  alias la='ls -A'
  alias l='ls -CF'
fi


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
  . /etc/bash_completion
fi


# mint-fortune
/usr/bin/mint-fortune


#personal alias
#--backup .scripts/ to drive.code/
alias scriptsBackup='rm -r /home/fejfar/drive.code/linux/.scripts && cp -r /home/fejfar/.scripts /home/fejfar/drive.code/linux && echo Done!'
#--add actual folder to /etc/profile and make a backup in .scripts/
alias addtopath='sudo sh -c "/home/fejfar/.scripts/addPath >> /etc/profile" && pathsBackup && echo Done!'
#--add ~/.scripts/addAlias output to .bashrc
alias addtoalias='sh /home/fejfar/.scripts/addAlias && sublime /home/fejfar/.bashrc & echo Done!'
#--make a backup from all custom aliases
alias aliasBackup='cat /home/fejfar/.bashrc | sed -n '110,+110p' > /home/fejfar/.scripts/.confBackup/alias && echo Done!'
#--make a backup from all custom paths
alias pathsBackup='cat /etc/profile | sed -n '32,+32p' > /home/fejfar/.scripts/.confBackup/paths && echo Done!'
#--all backups in one
alias allbackups='aliasBackup && pathsBackup && scriptsBackup && echo Done! && showBackups'
#--java study stuff
alias study_java='pdf /home/fejfar/drive.fejfar/Books/Programacao/Java/pdf/SCJP-KathySierra.pdf && nemo /home/fejfar/drive.code/largerMedia/SoftBlue'
#--android study stuff
alias study_android='eclipse_adt & nemo /home/fejfar/drive.code/largerMedia/Cursos/SoftBlue/Android/Aulas && totem /home/fejfar/drive.code/largerMedia/Cursos/SoftBlue/Android/Aulas/Playlist.pls &'
#--Show backups
alias showBackups='cat /home/fejfar/.scripts/.confBackup/*'
#--Minecraft
alias minecraft='/home/fejfar/.scripts/minecraftLauncher && cp -r /home/fejfar/Games/Minecraft/* /home/fejfar/drive.media/Games/Minecraft/ && cp -r /home/fejfar/.minecraft/saves /home/fejfar/.minecraft/screenshots /home/fejfar/drive.media/Games/Minecraft && echo Files synchronized!'
#--Minecraft server
alias serverminecraft='cd /home/fejfar/Games/Minecraft/server/ && java -Xms2048M -Xmx2048M -jar minecraft_server.1.7.10.jar nogui && cp -r /home/fejfar/Games/Minecraft/server /home/fejfar/drive.media/Games/Minecraft/ && echo Server files synchronized!'
#--backup home folder into hd
alias backuphome='cp -rv /home/fejfar/* /media/fejfar/hd/asusHome/'
#--setup xbox controller to play minecraft
alias xbox='sudo rmmod xpad; sudo xboxdrv -c /home/fejfar/Games/Minecraft/utils/minecraft.xboxdrv --silent'
#--open popcorn time
alias popcorntime='Popcorn-Time'

alias deploy='cp -rv /home/fejfar/drive.code/Codigos/workspaces/workTrainning/simpleTrainning/target/work.war /home/fejfar/Programs/jboss-as-7.1.1.Final/standalone/deployments'

#alias ufscarAppbackupInServer='cp -ruv /home/fejfar/drive.code/Codigos/workspaces/InGreen /run/user/1000/gvfs/smb-share:server=ingreen-srv1,share=ingreen/DevelopUFSCAR/ && echo DONE!'

alias headfirstandroid='xdg-open /home/fejfar/drive/d.fejfar/Books/Programacao/Java/pdf/HeadFirstAndroidDevelopment.pdf'
