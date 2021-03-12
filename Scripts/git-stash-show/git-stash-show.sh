#!/bin/zsh

# Developed by Roger Takeshita
# https://github.com/Roger-Takeshita/Shell-Script

NUM=$1

if [ ! $NUM ]; then
    git stash show stash@{0}
else
    git stash show stash@{$NUM}
fi