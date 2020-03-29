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
# - bash options: ------------------------------------------------------------
# enable alias
[ "${_shtype}" = "bash" ] && shopt -s expand_aliases

