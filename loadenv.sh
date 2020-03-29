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
source_dir=~/dotfiles.d
# system install 
# uncomment next line for a system wide install
#source_dir=/etc/profile.d/dotfiles

# ----------------------------------------------------------------------------
# - shell flavours: ----------------------------------------------------------
# select shell through a simple heuristic:
#   in login shell's, $0 resolves to [-]<shell>
case $0 in 
	*bash) shtype="bash"
	;;
	*ksh) shtype="ksh"
	;;
	*) printf "shell $0 is not suported; \n\t exiting dotfiles"
esac

# ----------------------------------------------------------------------------
# - sourcing orchestration: --------------------------------------------------
# prompt definition
if [ -f ${source_dir}/prompt.sh ]; then
	. ${source_dir}/prompt.sh
fi

# set shell options
if [ -f ${source_dir}/options.sh ]; then
	. ${source_dir}/options.sh
fi

# set functions
if [ -f ${source_dir}/functions.sh ]; then
	. ${source_dir}/functions.sh
fi

# alias definitions
if [ -f ${source_dir}/alias.sh ]; then
	. ${source_dir}/alias.sh
fi

# set up programming languages environment variables
if [ -f ${source_dir}/proglangs.sh ]; then
	. ${source_dir}/proglangs.sh
fi

# my apps environment variables
if [ -f ${source_dir}/apps.sh ]; then
	. ${source_dir}/apps.sh
fi

# ----------------------------------------------------------------------------
# - unset aux files and functions: -------------------------------------------
unset source_dir
unset shtype

