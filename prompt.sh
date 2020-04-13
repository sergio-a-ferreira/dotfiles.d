# ============================================================================
# name       : prompt.sh
# description: PS1 format and color settings
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
# PS1 formats
case "${SHELL_NAME}" in
	"bash")
		_prefix='\[\033['
		_suffix='m\]'
	;;
	"ksh")
		_prefix='\033['
		_suffix='m'
	;;
esac


# text format codes
typeset -A _text_formats=(
	['normal']='00'
	['bold']='01'
	['underline']="04"
	['flash']="05"
#	['reverse']=""
)


# text color codes
typeset -A _basic_colors=(
	['auto']='00'
	['black']='30'
	['red']='31'
	['green']='32'
	['yellow']='33'
	['blue']='34'
	['pink']='35'
	['cyan']='36'
	['white']='37'
)	


# prompt colors formated
# 	b_: bold
# 	u_: underline
# 	f_: flash / blink
typeset -A _prompt_colors=(
	
	['auto']="\033[0m"		# common to both bash and ksh
	
	['black']="${_prefix}${_text_formats['normal']};${_basic_colors['black']}${_suffix}"
	['b_black']="${_prefix}${_text_formats['bold']};${_basic_colors['black']}${_suffix}"
	['u_black']="${_prefix}${_text_formats['underline']};${_basic_colors['black']}${_suffix}"
	['f_black']="${_prefix}${_text_formats['flash']};${_basic_colors['black']}${_suffix}"
	
	['white']="${_prefix}${_text_formats['normal']};${_basic_colors['white']}${_suffix}"
	['b_white']="${_prefix}${_text_formats['bold']};${_basic_colors['white']}${_suffix}"
	['u_white']="${_prefix}${_text_formats['underline']};${_basic_colors['white']}${_suffix}"
	['f_white']="${_prefix}${_text_formats['flash']};${_basic_colors['white']}${_suffix}"
	
	['red']="${_prefix}${_text_formats['normal']};${_basic_colors['red']}${_suffix}"
	['b_red']="${_prefix}${_text_formats['bold']};${_basic_colors['red']}${_suffix}"
	['u_red']="${_prefix}${_text_formats['underline']};${_basic_colors['red']}${_suffix}"
	['f_red']="${_prefix}${_text_formats['flash']};${_basic_colors['red']}${_suffix}"
	
	['green']="${_prefix}${_text_formats['normal']};${_basic_colors['green']}${_suffix}"
	['b_green']="${_prefix}${_text_formats['bold']};${_basic_colors['green']}${_suffix}"
	['u_green']="${_prefix}${_text_formats['underline']};${_basic_colors['green']}${_suffix}"
	['f_green']="${_prefix}${_text_formats['flash']};${_basic_colors['green']}${_suffix}"
	
	['yellow']="${_prefix}${_text_formats['normal']};${_basic_colors['yellow']}${_suffix}"
	['b_yellow']="${_prefix}${_text_formats['bold']};${_basic_colors['yellow']}${_suffix}"
	['u_yellow']="${_prefix}${_text_formats['underline']};${_basic_colors['yellow']}${_suffix}"
	['f_yellow']="${_prefix}${_text_formats['flash']};${_basic_colors['yellow']}${_suffix}"
	
	['blue']="${_prefix}${_text_formats['normal']};${_basic_colors['blue']}${_suffix}"
	['b_blue']="${_prefix}${_text_formats['bold']};${_basic_colors['blue']}${_suffix}"
	['u_blue']="${_prefix}${_text_formats['underline']};${_basic_colors['blue']}${_suffix}"
	['f_blue']="${_prefix}${_text_formats['flash']};${_basic_colors['blue']}${_suffix}"
	
	['pink']="${_prefix}${_text_formats['normal']};${_basic_colors['pink']}${_suffix}"
	['b_pink']="${_prefix}${_text_formats['bold']};${_basic_colors['pink']}${_suffix}"
	['u_pink']="${_prefix}${_text_formats['underline']};${_basic_colors['pink']}${_suffix}"
	['f_pink']="${_prefix}${_text_formats['flash']};${_basic_colors['pink']}${_suffix}"
	
	['cyan']="${_prefix}${_text_formats['normal']};${_basic_colors['cyan']}${_suffix}"
	['b_cyan']="${_prefix}${_text_formats['bold']};${_basic_colors['cyan']}${_suffix}"
	['u_cyan']="${_prefix}${_text_formats['underline']};${_basic_colors['cyan']}${_suffix}"
	['f_cyan']="${_prefix}${_text_formats['flash']};${_basic_colors['cyan']}${_suffix}"
)


case "${SHELL_NAME}" in
	"bash")
		PS1="${_prompt_colors['blue']}\u@\H:\w [${_prompt_colors['cyan']}\t${_prompt_colors['blue']}] \$ ${_prompt_colors[auto]}"
	;;
	"ksh")
		PS1=$(print -n "${_prompt_colors['blue']}${USER}@${HOSTNAME}:\${PWD} [${_prompt_colors['cyan']}\$(date +"%H:%M:%S")${_prompt_colors['blue']}] $ ${_prompt_colors['auto']}")
	;;
esac

export PS1
unset _prefix _suffix _text_formats _basic_colors _prompt_colors
