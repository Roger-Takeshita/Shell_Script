#!/bin/zsh

# Developed by Roger Takeshita
# https://github.com/Roger-Takeshita/Shell-Script

RSTC=$'\e[39m'        # reset color
CLGY=$'\e[38;5;240m'  # gray
CLOG=$'\e[38;5;215m'  # light orange
RSTF=$'\e[0m'
Dim=$'\e[2m'
Bold=$'\e[1m'

NUM=$1

if [ ! $NUM ]; then
    NUM=0
fi

echo ""
echo -n "Are you sure you want to drop stash ${CLOG}${Bold}${NUM}${RSTC}${RSTF}: ${Dim}${CLGY}(Y/n)${RSTC}${RSTF} "
read ANSWER

if [ "$ANSWER" = "" ] || [ "$ANSWER" = "Y" ] || [ "$ANSWER" = "y" ] || [ "$ANSWER" = "Yes" ] || [ "$ANSWER" = "yes" ]; then
    git stash drop stash@{$NUM}
fi

echo ""