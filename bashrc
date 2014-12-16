if [ -d $HOME/local/bin ]; then
	export PATH=$HOME/local/bin:$PATH
fi

if [ -d $HOME/work/bin ]; then
	export PATH=$PATH:$HOME/work/bin
fi

# needed for ifconfig
export PATH=$PATH:/sbin:/usr/sbin

alias grep='grep --color=auto'
alias ls='ls --color=always'
alias l='ls -1'
alias la='ls -a'
alias lA='ls -A'
alias ll='ls -l'
alias dmsg='dmesg | tail'
alias dm20='dmesg | tail -20'
alias dm30='dmesg | tail -30'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias sp="pwd | p"
alias lp='cd `p`'
alias lc='l *.c'
alias lh='l *.h'
alias pat='pygmentize -g'
alias vat='pygmentize -g'
alias g=git
#alias cdue='cd ~/work/tools/uestub'
#alias csue='export CSCOPE_DB=$HOME/local/cscope/uestub/cscope.out'

# git aliases
alias gl='git log'
alias gco='git checkout'
alias gb='git branch'

ulimit -c unlimited

#export PS1="\[\e[32;1m\]\w \[\e[37;1m\]\$?\[\e[0;32m\] \$ \[\e[0m\]"
#export PS1="\[\e[32m\]\w \[\e[37;1m\]\$? \! \[\e[0;32m\]\$ \[\e[0m\]"
#export PS1="\[\e[42;30m\]\w \$? \! \$\[\e[0m\] "
#export PS1="\[\e[42;30m\]\w\[\e[0m\] \[\e[37;1m\]\$? \! \[\e[0;32m\]\$ \[\e[0m\]"
export PS1="\[\e[30;42m\]\w\[\e[0m\] \[\e[37;1m\]\$? \[\e[0;32m\]\$ \[\e[0m\]"

alias cd7='cd ~/6.70.0xx'
alias cd82='cd ~/mtk/6.82.0xx'
alias cd72='cd ~/6.72.0xx'
alias sp='pwd | p'
alias lp='cd `p`'

# PROMPTS from http://www.maketecheasier.com/8-useful-and-interesting-bash-prompts/
# Change color on bad command
#PROMPT_COMMAND='PS1="\[\033[0;33m\][\!]\`if [[ \$? = "0" ]]; then echo "\\[\\033[32m\\]"; else echo "\\[\\033[31m\\]"; fi\`[\u.\h: \`if [[ `pwd|wc -c|tr -d " "` > 18 ]]; then echo "\\W"; else echo "\\w"; fi\`]\$\[\033[0m\] "; echo -ne "\033]0;`hostname -s`:`pwd`\007"'
#export PROMPT_COMMAND

# Show Happy face upon successful execution
#export PS1="\`if [ \$? = 0 ]; then echo \[\e[33m\]^_^\[\e[0m\]; else echo \[\e[31m\]O_O\[\e[0m\]; fi\`[\u@\h:\w]\\$ "

# MultiLine Prompt
#export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"
#export PS1="\n\[\033[35m\]\$(/bin/date)\n\[\033[32m\]\w\n\[\033[1;31m\]\u@\h: \[\033[1;34m\]\$(/usr/bin/tty | /bin/sed -e 's:/dev/::'): \[\033[1;36m\]\$(/bin/ls -1 | /usr/bin/wc -l | /bin/sed 's: ::g') files \[\033[1;33m\]\$(/bin/ls -lah | /bin/grep -m 1 total | /bin/sed 's/total //')b\[\033[0m\] -> \[\033[0m\]"

#export PS1="\[\033[35m\][\u@\h \[\033[32;1m\]\w\[\033[0m\]\[\033[35m\]]\[\033[0m\]\n\[\033[33;1m\]\$? >\[\033[0m\] "
export PS1="\n\[\033[35m\][\[\033[32;1m\]\w\[\033[0m\]\[\033[35m\]]\[\033[0m\]\n\[\033[33;1m\]\$? >\[\033[0m\] "

export EDITOR=vim

alias mkcs='cscope -bR'
alias cdclr='cd ~/6.70.0xx/platformdb/clr240/SAMSUNG_PUMA6/extra/src/utils/clr_rpc_wlan_config-240/src'
#alias f='find -name'

# golang
export GOROOT=$HOME/local/golang
export PATH=$PATH:$GOROOT/bin

color() { "$@" 2>&1>&3|sed 's,.*,\x1B[1;31m&\x1B[0m,'>&2; return ${PIPESTATUS[0]}; } 3>&1

up() {
	if [ $# -eq 0 ]; then
		cd ..
		return 0
	fi

	local TIMES=$1
	while [ $TIMES -ne 0 ]; do
		cd ..
		let TIMES=TIMES-1
	done

	return 0
}

mnt() {
	if [ -z "$1" ]; then
		sudo mount -o iocharset=cp866,utf8 /dev/$(cat ~/.last_mounted) /mnt
	else
		echo $1 > ~/.last_mounted
		sudo mount -o iocharset=cp866,utf8 /dev/$1 /mnt
	fi
}

unmnt() {
	if mount | grep -q '/mnt'; then
		sudo umount /mnt
	else
		echo -e "\033[31;1mOOPS, /mnt seems not to be mounted\033[0m"
	fi
}

gf() {
	grep --color=auto -RInF "$@" *
}

ge() {
	grep --color=auto -RInE "$@" *
}

v() {
	case $# in
		0) vim ;;
		1) vim $@ ;;
		*) vim -p $@ ;;
	esac
}

unt() {
	tar xf $@
}

vunt() {
	tar vxf $@
}

# z
#source ~/local/bin/z-repo/z.sh

hex2dec() {
	echo "ibase=16; $@" | bc
}

dec2hex() {
	echo "obase=16; $@" | bc
}

clc() {
	echo "$(($@))"
}

ic() {
	sudo ifconfig $@
}

f() {
	if [ $# -eq 2 ]; then
		cd $2
	fi
	find -name $1
}
