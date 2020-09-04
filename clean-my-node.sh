#!/bin/zsh

# Developed by Roger Takeshita
# https://github.com/Roger-Takeshita/Shell-Script

tput reset

dir="`pwd`"
red=$'\e[0;31m'
end=$'\e[0m'
grn=$'\e[0;32m'
fade=$'\e[2m'   # fade
bold=$'\e[1m'   # bold fade
statusFlag=0

freeCurrentFolder() {
    if [ -d "node_modules" ]; then
        rm -rf "node_modules"
        echo "${red}${bold}Deleted${end} node_modules"
        statusFlag=1
    fi
    if [ -f "package-lock.json" ]; then
        rm "package-lock.json"
        echo "${red}${bold}Deleted${end} package-lock.json"
        statusFlag=1
    fi
}

freeNestedFolder() {
    if [ -d $f ]; then
        echo "${red}$f"

        if [ -d "$f/node_modules" ]; then
            rm -rf "$f/node_modules"
            echo "${red}${bold}Deleted${end} $f/node_modules"
            statusFlag=1
        fi
        if [ -f "$f/package-lock.json" ]; then
            rm "$f/package-lock.json"
            echo "${red}${bold}Deleted${end} $f/package-lock.json"
            statusFlag=1
        fi

        for f in $1/*
        do
            if [ -d "$f/node_modules" ]; then
                rm -rf "$f/node_modules"
                echo "${red}${bold}Deleted${end} $f/node_modules"
                statusFlag=1
            fi
            if [ -f "$f/package-lock.json" ]; then
                rm "$f/package-lock.json"
                echo "${red}${bold}Deleted${end} $f/package-lock.json"
                statusFlag=1
            fi
        done
    fi
}

freeCurrentFolder

for f in $dir/*
do
    freeNestedFolder $f
done

if [ $statusFlag -eq 1 ]; then
    echo "${grn}Done"
else
    echo "${grn}All Good"
fi