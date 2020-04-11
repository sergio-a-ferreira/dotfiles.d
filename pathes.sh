# ============================================================================
# name       : apps.sh
# description: set pathes to programming languages and user applications
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# programming languages
# ----------------------------------------------------------------------------
# - golang:
# see go env for a full list of go environment variables
#
# the GOPATH environment variable is the root of the workspace and
#   is used to specify directories outside of $GOROOT that contain the source 
#   for Go projects and their binaries.
# contains the following folders:
#   > src — location of source files: .go, .c, .g, .s
#   > pkg — location of compiled packages (.a files)
#   > bin — location of executables built by Go
# like the PATH environment variable, GOPATH is a list of directories 
#   separated with : (; on Windows).
export GOPATH=~/go
#
# the directory where go install and go get will place binaries 
#   after building main packages. 
# generally this is set to somewhere on the system PATH so that 
#   installed binaries can be run and discovered easily.
export GOBIN=${GOPATH}/bin
[ ! -d ${GOBIN} ] && mkdir -p ${GOBIN}
export PATH="${PATH}:${GOBIN}"


# ============================================================================
# user applications
# ----------------------------------------------------------------------------
# - bash_fw:
if [ "${SHELL_NAME}" = "bash" ]; then
	export BASHFW_PATH=~/bash_fw
	[ ! -d ${BASHFW_PATH} ] && mkdir -p ${BASHFW_PATH}
fi

