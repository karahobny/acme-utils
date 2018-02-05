#!/bin/sh

BROWSER=chrome
PLUMBFILE=$HOME/lib/plumbing
#export font=/mnt/font/Cousine/8a/font
tabstop=4
SHELL=$PLAN9/bin/rc
acmeshell=$PLAN9/bin/rc

TERM=dumb
MANPAGER=nobs
PAGER=nobs
EDITOR=E

PLAN9=/usr/local/plan9
PATH=$PATH:$PLAN9/bin
MANPATH=$MANPATH:$PLAN9/man

export BROWSER TERM MANPAGER \
PAGER EDITOR PLAN9 PATH MANPATH SHELL
unset FCEDIT VISUAL

export tabstop acmeshell

[ -z "$(pgrep fontsrv)" ] && fontsrv;
[ -z "$(pgrep plumber)" ] && plumber;

if [ -f "$PLUMBFILE" ]; then
	cat "$PLUMBFILE" | 9p write plumb/rules
else
	cat $PLAN9/plumb/basic | 9p write plumb/rules
fi

exec acme $*
