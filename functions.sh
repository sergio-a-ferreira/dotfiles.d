# ============================================================================
# name       : functions.sh
# description: auxiliary functions
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200411
# ============================================================================
# ----------------------------------------------------------------------------
# - system and OS functions: -------------------------------------------------
hostName () {
	# prints the hostname name
	hostname
	return $?
}

hostAddr () {
	# prints the hostname IP address
	echo >/dev/null
	return $?
}

osType () {
	# prints OS type (kernel name)
	uname -s
	return $?	
}

osName () {
	# prints linux distro
	grep "^NAME=" /etc/os-release | cut -d"=" -f2 | sed 's/"//'g
	return $?
}

osVersion () {
	# prints linux distro
	grep "^VERSION_ID=" /etc/os-release | cut -d"=" -f2 | sed 's/"//'g
	return $?
}

osKernel () {
	# prints distro kernel
	uname -r
	return $?	
}

osArchitecture () {
	# prints OS architecture
	uname -m
	return $?
}

osPrettyName () {
	# prints linux distro pretty name
	grep "^PRETTY_NAME=" /etc/os-release | cut -d"=" -f2 | sed 's/"//'g
	return $?
}

# ----------------------------------------------------------------------------
# - shell functions: ---------------------------------------------------------
shellName () {
	# prints the shell type: bash; ksh; ...
	basename $(readlink /proc/$$/exe)
	return $?
}

shellVersion () {
	# prints the shell version
	$(readlink /proc/$$/exe) --version | head -1
	return $?
}

shellIsLogin () {
	# returns 0 if is a login shell
	#		  1 if is a non-login shell
	case $(shellName) in
		bash)
			shopt -q login_shell
			_rc=$?
		;;
		*ksh*)
			[ -o login ]
			_rc=$?
		;;
	esac

	return ${_rc}
}

shellIsInteractive () {
	# returns 0 if is a interactive shell
	#		  1 if is a non-interactive shell
	printf $- | grep -qi i
	return $?	
}

shellType () {
	# prints the shell type: (non)login; (non)interactive
	# tokens: [nl|l];[ni|i]
	shellIsLogin && _token="l" || _token="nl"
	_token="${_token};"
	shellIsInteractive && _token="${_token}i" || _token="${_token}ni" 

	printf "${_token}\n"
	unset _token
}

# ----------------------------------------------------------------------------
# - user and group functions: ------------------------------------------------
userName () {
	# prints the user name
	id -un
	return $?
}

userUID () {
	# prints the user uid
	id -u
	return $?
}

userGroup () {
	# prints the user main group name
	id -gn
	return $?
}

userGID () {
	# prints the user main group gid
	id -g
	return $?
}

userGroups () {
	# prints the user group names
	id -Gn
	return $?
}

userGIDs () {
	# prints the user gids
	id -G
	return $?
}

# ----------------------------------------------------------------------------
# - path manipulation: -------------------------------------------------------
pathMunge () {
	# adds a directory to ${PATH} start
	# arguments:
	#  directory to add
	#  flag "after" to add to end
	_dir=${1}
	_flag=${2}

	case ":${PATH}:" in
		*:"${_dir}":*)
    ;;
	*)
    	if [ "${_flag}" = "after" ]; then
        	PATH=${PATH}:${_dir}
    	else
        	PATH=${_dir}:${PATH}
    	fi
    ;;
	esac

	export PATH
}

