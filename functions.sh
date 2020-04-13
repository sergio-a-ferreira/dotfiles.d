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
	#		  2 if can't determine shell type
	#		128 if shell is not supported
	case $(shellName) in
		bash)
			shopt -q login_shell
			_rc=$?
		;;
		*ksh*)
			_status=$(set -o)
			_status=$(print "${_status}" | grep "login_shell" | sed 's/\ .*\ /\ /g' | cut -d" " -f2)
			
			if [ "${_status}" = "on" ]; then
				_rc=0
			elif [ "${_status}" = "off" ]; then
				_rc=1
			else
				_rc=2
			fi
		;;
		*)	_rc=128
			printf "shell $(shellName) is not suported;\nerror ${err}: exiting dotfiles\n" 1>&2
			exit ${_rc}
		;;
	esac

	unset _status
	return ${_rc}
}

shellIsInteractive () {
	# returns true if is a interactive shell
	printf $- | grep -qi i
	return $?	
}

shellType () {
	# prints the shell type: (non)login; (non)interactive
	# tokens:
	#	[nl|l];[ni|i]
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

