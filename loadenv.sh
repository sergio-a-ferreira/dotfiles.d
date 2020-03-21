# loadenv.sh
# sources environment scripts

# local install
source_dir=~/dotfiles.d
# system install 
# uncomment next line for a system wide install
#source_dir=/etc/profile.d/dotfiles

case $0 in 
	bash) shtype="bash"
	;;
	ksh) shtype="ksh"
	;;
	*) printf "shell $0 is not suported; \n\t exiting dotfiles"
esac

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

unset source_dir
unset shtype

