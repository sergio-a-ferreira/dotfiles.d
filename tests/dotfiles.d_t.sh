# ============================================================================
# name       : dotfiles.d_t.sh
# description: test dotfiles.d script sourcing 
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200330
# ============================================================================
# ----------------------------------------------------------------------------
# load dotfiles.d environment
. ~/dotfiles.d/setenv.sh

# log execution
logfile=${_source_dir}/_${SHELL_TYPE}_test.log

echo "***************************************************" >>${logfile} 2>&1
echo "start          : $(date +"%Y-%m-%d %H:%M:%S")" >>${logfile} 2>&1
echo "\$0             : $0" >>${logfile} 2>&1
echo "pwd            : $(pwd)" >>${logfile} 2>&1
echo "_source_dir    : ${_source_dir}" >>${logfile} 2>&1
echo "SHELL_TYPE     : ${SHELL_TYPE}" >>${logfile} 2>&1
echo "perm           : $(perm ${0})" >>${logfile} 2>&1
echo "end            : $(date +"%Y-%m-%d %H:%M:%S")" >>${logfile} 2>&1
pass >>${logfile} 2>&1
pass >>${logfile} 2>&1
