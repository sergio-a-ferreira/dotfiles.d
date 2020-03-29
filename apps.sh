# ============================================================================
# name       : apps.sh
# description: environment variables needed by user apps
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# ----------------------------------------------------------------------------
# - bash_fw: -----------------------------------------------------------------
if [ "${shtype}" = "bash" ]; then
	export BASHFW_PATH=~/bash_fw
	[ ! -d ${BASHFW_PATH} ] && mkdir -p ${BASHFW_PATH}
fi

