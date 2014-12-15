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
