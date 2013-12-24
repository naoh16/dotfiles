
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=$HOME/opt/julius-4.2.3/bin:$PATH

# Default
#export PS1="\h:\W \u\$ "
# Default (Debian)
#export PS1='\u@\h:\W\$ '
export PS1="\[\033[0;32m\]\u@\h:\W\$\[\033[0;37m\] "

# ls for Black-background
if [ x`uname` == 'xDarwin' ]; then
  export LSCOLORS=gxfxcxdxbxegedabagacad
  alias ls='ls -G'
fi

function makec {
	make $* 2>&1 | ~/bin/make_filter.pl
}
alias make=makec

