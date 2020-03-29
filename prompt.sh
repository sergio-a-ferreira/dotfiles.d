# ============================================================================
# name       : prompt.sh
# description: PS1 format and color settings
# arguments  : N/A
# returns    : N/A
# author     : sergio ferreira <sfer96@gmail.com>
# date       : 20200310
# ============================================================================
case "${shtype}" in

	"bash")
		declare -A PROMPT_COLORS

		PROMPT_COLORS[NORMAL]='\033[0m'
		PROMPT_COLORS[RED]="\[\e[1;31m\]"
		PROMPT_COLORS[GREEN]="\[\e[1;32m\]"
		PROMPT_COLORS[YELLOW]="\[\e[1;33m\]"
		PROMPT_COLORS[BLUE]="\[\e[1;34m\]"
		PROMPT_COLORS[PINK]="\[\e[1;35m\]"
		PROMPT_COLORS[CYAN]="\[\e[1;36m\]"
		PROMPT_COLORS[WHITE]="\[\e[1;37m\]"

		PS1="${PROMPT_COLORS[BLUE]}\u@\H:\w [${PROMPT_COLORS[CYAN]}\t${PROMPT_COLORS[BLUE]}]\$ ${PROMPT_COLORS[NORMAL]}"
	;;
	"ksh")
		color=(
			black='\033[30m' \
			red='\033[31m' \
			green='\033[32m' \
			brown='\033[33m' \
			blue='\033[34m' \
			purple='\033[35m' \
			cyan='\033[36m' \
			lightgray='\033[37m' \
			darkgray='\033[1;30m' \
			lightred='\033[1;31m' \
			lightgreen='\033[1;32m' \
			yellow='\033[1;33m' \
			lightblue='\033[1;34m' \
			pink='\033[1;35m' \
			lightcyan='\033[1;36m' \
			white='\033[1;37m' \
			auto='\033[0m'
		)

		PS1=$( print -n "${color.lightblue}${USER}@${HOSTNAME}:\${PWD}${color.lightcyan} [\$(date +"%H:%M:%S")]${color.lightblue}$ ${color.auto}" )
	;;
esac

export PS1

