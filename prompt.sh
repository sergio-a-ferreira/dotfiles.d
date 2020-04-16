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
		_prf='\[\033['
		_suf='m\]'
	;;
	"ksh")
		_prf='\033['
		_suf='m'
	;;
esac


# text format codes
typeset -A _txt_fmt=(
	['normal']='00'
	['bold']='01'
	['underline']="04"
	['flash']="05"
#	['reverse']=""
)


# text color codes
typeset -A _txt_clr=(
	['black']='30'
	['red']='31'
	['green']='32'
	['yellow']='33'
	['blue']='34'
	['magenta']='35'
	['cyan']='36'
	['white']='37'
)	

# background color codes
typeset -A _bg_clr=(
	['black']='40'
	['red']='41'
	['green']='42'
	['yellow']='43'
	['blue']='44'
	['magenta']='45'
	['cyan']='46'
	['white']='47'
)

# high intensity color codes
typeset -A _hi_clr=(
	['black']='90'
	['red']='91'
	['green']='92'
	['yellow']='93'
	['blue']='94'
	['magenta']='95'
	['cyan']='96'
	['white']='97'
)

# background high intensity color codes
typeset -A _bg_hi_clr=(
	['black']='100'
	['red']='101'
	['green']='102'
	['yellow']='103'
	['blue']='104'
	['magenta']='105'
	['cyan']='106'
	['white']='107'
)

# prompt colors formated
# 	b_: bold
# 	u_: underline
# 	f_: flash / blink
typeset -A _ps1=(
	
	# text reset
	['normal']="\033[0m"		# common to both bash and ksh
	
	# regular colors
	['black']="${_prf}${_txt_fmt['normal']};${_txt_clr['black']}${_suf}"
	['red']="${_prf}${_txt_fmt['normal']};${_txt_clr['red']}${_suf}"
	['green']="${_prf}${_txt_fmt['normal']};${_txt_clr['green']}${_suf}"
	['yellow']="${_prf}${_txt_fmt['normal']};${_txt_clr['yellow']}${_suf}"
	['blue']="${_prf}${_txt_fmt['normal']};${_txt_clr['blue']}${_suf}"
	['magenta']="${_prf}${_txt_fmt['normal']};${_txt_clr['magenta']}${_suf}"
	['cyan']="${_prf}${_txt_fmt['normal']};${_txt_clr['cyan']}${_suf}"
	['white']="${_prf}${_txt_fmt['normal']};${_txt_clr['white']}${_suf}"

	# bold colors
	['b_black']="${_prf}${_txt_fmt['bold']};${_txt_clr['black']}${_suf}"
	['b_red']="${_prf}${_txt_fmt['bold']};${_txt_clr['red']}${_suf}"
	['b_green']="${_prf}${_txt_fmt['bold']};${_txt_clr['green']}${_suf}"
	['b_yellow']="${_prf}${_txt_fmt['bold']};${_txt_clr['yellow']}${_suf}"
	['b_blue']="${_prf}${_txt_fmt['bold']};${_txt_clr['blue']}${_suf}"
	['b_magenta']="${_prf}${_txt_fmt['bold']};${_txt_clr['magenta']}${_suf}"
	['b_cyan']="${_prf}${_txt_fmt['bold']};${_txt_clr['cyan']}${_suf}"
	['b_white']="${_prf}${_txt_fmt['bold']};${_txt_clr['white']}${_suf}"

	# underlined
	['u_black']="${_prf}${_txt_fmt['underline']};${_txt_clr['black']}${_suf}"
	['u_red']="${_prf}${_txt_fmt['underline']};${_txt_clr['red']}${_suf}"
	['u_green']="${_prf}${_txt_fmt['underline']};${_txt_clr['green']}${_suf}"
	['u_yellow']="${_prf}${_txt_fmt['underline']};${_txt_clr['yellow']}${_suf}"
	['u_blue']="${_prf}${_txt_fmt['underline']};${_txt_clr['blue']}${_suf}"
	['u_magenta']="${_prf}${_txt_fmt['underline']};${_txt_clr['magenta']}${_suf}"
	['u_cyan']="${_prf}${_txt_fmt['underline']};${_txt_clr['cyan']}${_suf}"
	['u_white']="${_prf}${_txt_fmt['underline']};${_txt_clr['white']}${_suf}"

	# blinking / flashing
	['f_black']="${_prf}${_txt_fmt['flash']};${_txt_clr['black']}${_suf}"
	['f_red']="${_prf}${_txt_fmt['flash']};${_txt_clr['red']}${_suf}"
	['f_green']="${_prf}${_txt_fmt['flash']};${_txt_clr['green']}${_suf}"
	['f_yellow']="${_prf}${_txt_fmt['flash']};${_txt_clr['yellow']}${_suf}"
	['f_blue']="${_prf}${_txt_fmt['flash']};${_txt_clr['blue']}${_suf}"
	['f_white']="${_prf}${_txt_fmt['flash']};${_txt_clr['white']}${_suf}"
	['f_magenta']="${_prf}${_txt_fmt['flash']};${_txt_clr['magenta']}${_suf}"
	['f_cyan']="${_prf}${_txt_fmt['flash']};${_txt_clr['cyan']}${_suf}"
)


case "${SHELL_NAME}" in
	"bash")
		PS1="${_ps1['blue']}\u@\H:\w [${_ps1['cyan']}\t${_ps1['blue']}] \$ ${_ps1[normal]}"
	;;
	"ksh")
		PS1=$(print -n "${_ps1['blue']}${USER}@${HOSTNAME}:\$(pwd|sed 's|${HOME}|~|') [${_ps1['cyan']}\$(date +"%H:%M:%S")${_ps1['blue']}] $ ${_ps1['normal']}")
	;;
esac

export PS1
unset _prf _suf _txt_fmt _txt_clr _bg_clr _hi_clr _bg_hi_clr _ps1
