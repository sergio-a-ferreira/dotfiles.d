# ============================================================================
# name       : alias.sh
# description: user defined aliases
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# ----------------------------------------------------------------------------
# - list files: --------------------------------------------------------------
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
# to see environment functions
alias functions='typeset -f '

# returns octal permissions for a file
alias perm='stat -c "%a %n" '

# google-chrome browser
alias chrome='google-chrome '

# python pass emulation
alias pass='echo >/dev/null '

