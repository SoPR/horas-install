#!/bin/bash

echo "alias ls='ls -lah --color'" >> /home/vagrant/.profile
echo "export GREP_OPTIONS='--color=auto'" >> /home/vagrant/.profile
echo "export CLICOLOR=1" >> /home/vagrant/.profile
echo "export LS_COLORS='di=33:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35'" >> /home/vagrant/.profile
echo "alias runhoras='python manage.py brunchserver 0.0.0.0:8000'" >> /home/vagrant/.profile

# Configure prompt
PROMPTCONFIG=$(cat <<EOM
if [[ \$COLORTERM = gnome-* && \$TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
      export TERM=gnome-256color
    elif infocmp xterm-256color >/dev/null 2>&1; then
          export TERM=xterm-256color
        fi

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
        badgrn='\e[42m'   # Green
        bakylw='\e[43m'   # Yellow
        bakblu='\e[44m'   # Blue
        bakpur='\e[45m'   # Purple
        bakcyn='\e[46m'   # Cyan
        bakwht='\e[47m'   # White

        txtrst='\e[0m'    # Text Reset

        function parse_git_dirty() {
          [[ \$(git status 2> /dev/null | tail -n1) != "nothing to commit (working directory clean)" ]] && echo "*"
        }

        function parse_git_branch() {
          git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1\$(parse_git_dirty)/"
        }

        PS1="\[\${txtgrn}\]\u \[\${bldblu}\]at \[\${txtylw}\]\h \[\${bldblu}\]in \[\${bldred}\]\w\[\${bldblu}\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[\${txtpur}\]\$(parse_git_branch)\[\${bldblu}\]\n\$ \[\${txtrst}\]"
EOM
)
echo "$PROMPTCONFIG" >> /home/vagrant/.profile
