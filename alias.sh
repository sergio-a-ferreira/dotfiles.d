# ============================================================================
# name       : alias.sh
# description: user defined aliases
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# ----------------------------------------------------------------------------
# - list colors: -------------------------------------------------------------
alias ls='ls --color=auto' 2>/dev/null
alias ll='ls -l --color=auto' 2>/dev/null
alias l.='ls -d .* --color=auto' 2>/dev/null
alias kl='clear; date; pwd; echo ""; ls -ltr '
alias lk='kl '
alias klr='kl -R '

# ----------------------------------------------------------------------------
# - grep colors: -------------------------------------------------------------
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'

# ----------------------------------------------------------------------------
# - update / upgrade system: -------------------------------------------------
# need root previleges
which dnf >/dev/null 2>&1
if [ $? -eq 0 ]; then
	# Red Hat / Fedora / CentOS ...?
	alias update='sudo dnf update && sudo dnf upgrade'
else
	# debian / ubuntu ...?
	which apk >/dev/null 2>&1
	if [ $? -eq 0 ]; then
		alias update='sudo apk update && sudo apk upgrade'
	else
		alias update='printf "error: evaluate install tool\n"'
	fi
fi

# ----------------------------------------------------------------------------
# - other user aliases: -----------------------------------------------------
alias functions='typeset -f '	# to see environment functions
alias perm='stat -c "%a %n" '	# returns octal permissions for a file

alias chrome='google-chrome '	# google-chrome browser

alias integer='typeset -i '
alias constant='typeset -r '	# => readonly --> can't be unset
alias upper='typeset -u '
alias lower='typeset -l '
alias array='typeset -a '		# val01 val02 val...
alias dict='typeset -A '		# ['black']=value
alias pass='echo >/dev/null '	# python pass emulation

