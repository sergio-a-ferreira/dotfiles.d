# ============================================================================
# name       : functions.sh
# description: auxiliary functions
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200411
# ============================================================================
# ----------------------------------------------------------------------------
shellName () {

	# prints the shell type: bash; ksh; ...

	printf $(basename $(readlink /proc/$$/exe))
	return $?
}


