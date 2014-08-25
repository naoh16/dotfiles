#
# bashprofile
#


# Default
#  export PS1="\h:\W \u\$ "
# Default (Debian)
#  export PS1='\u@\h:\W\$ '
#export PS1="\[\033[0;32m\]\u@\h:\W\$\[\033[0;37m\] "
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\n\$ '

# For terminal window's title
case $TERM in
	kterm|xterm|mlterm|cygwin|vt102)
		_termtitle="\u@\h:\w"
		PS1="\[\e]0;${_termtitle}\007\]${PS1}"
		;;
esac

# ls for Black-background
if [ x`uname` == 'xDarwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
fi

function makec {
	make $* 2>&1 | ~/bin/make_filter.pl
}
alias make=makec

#
# Path setting
#

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
