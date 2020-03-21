# alias.sh
# set up some useful aliases

# some sugar to list files
alias kl='clear; date; pwd; echo ""; ls -ltr '
alias lk='kl '
alias klr='kl -R '


# to see environment functions
alias functions='typeset -f '

# an alias for updating the system
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

# returns octal permissions for a file
alias perm='stat -c "%a %n"'

# an alias for google-chrome browser
alias chrome='google-chrome '

