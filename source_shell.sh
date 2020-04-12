# ============================================================================
# name       : source_shell.sh
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
# load auxiliary functions
if [ -f ${_source_dir}/functions.sh ]; then
	. ${_source_dir}/functions.sh
fi

case $(shellName) in
	bash)
		SHELL_NAME="bash"
	;;
	*ksh*)
		SHELL_NAME="ksh"
		export SHELL=$(which ksh)
	;;
	*)	_rc=128
		printf "shell ${_shtype} is not suported;\nerror ${err}: exiting dotfiles\n" 1>&2
		exit ${_rc}
	;;
esac
export SHELL_NAME

# ----------------------------------------------------------------------------
# - sourcing orchestration: --------------------------------------------------
# set shell options
if [ -f ${_source_dir}/options.sh ]; then
	. ${_source_dir}/options.sh
fi

# alias definitions
if [ -f ${_source_dir}/alias.sh ]; then
	. ${_source_dir}/alias.sh
fi

# set up pathes to programming languages and user apps
if [ -f ${_source_dir}/pathes.sh ]; then
	. ${_source_dir}/pathes.sh
fi

# prompt definition
if [ -f ${_source_dir}/prompt.sh ]; then
	. ${_source_dir}/prompt.sh
fi

# ----------------------------------------------------------------------------
# - unset aux files and functions: -------------------------------------------
unset _source_dir


