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
_shtype=$(basename $(readlink /proc/$$/exe))

case "${_shtype}" in
	bash)	_shtype="bash";;
	ksh*)	_shtype="ksh";;
	*)	err=128
		printf "shell ${_shtype} is not suported;\nerror ${err}: exiting dotfiles\n" 1>&2
		exit ${err}
	;;
esac
shelltype=${_shtype}

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

