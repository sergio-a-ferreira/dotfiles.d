# ============================================================================
# name       : options.sh
# description: enable / disable shell options
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# ----------------------------------------------------------------------------
# - common options: ----------------------------------------------------------
# enable vim-like navigation in the terminal
set -o vi

# enable command history expansion
set -o histexpand on

# ----------------------------------------------------------------------------
# - ksh options: -------------------------------------------------------------
if [ "${SHELL_NAME}" = "ksh" ]; then
	# enable multiline prompt
	set -o multiline
	# load ls --colors
	[ -f /etc/profile.d/colorls.sh ] && . /etc/profile.d/colorls.sh
fi

# ----------------------------------------------------------------------------
# - bash options: ------------------------------------------------------------
# enable alias
if [ "${SHELL_NAME}" = "bash" ]; then
	shopt -s expand_aliases
fi
