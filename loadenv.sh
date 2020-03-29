# ============================================================================
# name       : loadenv.sh
# description: orchestrate environment scripts sourcing
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# ----------------------------------------------------------------------------
# - installation type: -------------------------------------------------------
# local install
_source_dir=~/dotfiles.d
# system install 
# uncomment next line for a system wide install
#_source_dir=/etc/profile.d/dotfiles

# ----------------------------------------------------------------------------
# - shell flavours: ----------------------------------------------------------
# select shell through a simple heuristic:
#   in login shell's, $0 resolves to [-]<shell>
case $0 in 
	*bash) _shtype="bash"
	;;
	*ksh) _shtype="ksh"
	;;
	*) printf "shell $0 is not suported; \n\t exiting dotfiles"
esac

# ----------------------------------------------------------------------------
# - sourcing orchestration: --------------------------------------------------
# prompt definition
if [ -f ${_source_dir}/prompt.sh ]; then
	. ${_source_dir}/prompt.sh
fi

# set shell options
if [ -f ${_source_dir}/options.sh ]; then
	. ${_source_dir}/options.sh
fi

# set functions
if [ -f ${_source_dir}/functions.sh ]; then
	. ${_source_dir}/functions.sh
fi

# alias definitions
if [ -f ${_source_dir}/alias.sh ]; then
	. ${_source_dir}/alias.sh
fi

# set up programming languages environment variables
if [ -f ${_source_dir}/proglangs.sh ]; then
	. ${_source_dir}/proglangs.sh
fi

# my apps environment variables
if [ -f ${_source_dir}/apps.sh ]; then
	. ${_source_dir}/apps.sh
fi

# ----------------------------------------------------------------------------
# - unset aux files and functions: -------------------------------------------
unset _source_dir
unset _shtype

