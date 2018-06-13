#!/bin/bash

# set this to true if jseek produces false-positives
CONT_AFTER_EXIT0=false

JPG=$1
WORDLIST=$2

if [ -z "$JPG" ] || [ -z "$WORDLIST" ];then
    echo "usage: $0 <jpg> <wordlist>" 1>&2;
    exit 1;
fi

[ ! -e "$JPG" ] && echo "error: $JPG doesn't exists." 1>&2 && exit 2; 
[ ! -e "$WORDLIST" ] && echo "error: $WORDLIST doesn't exists." 1>&2 && exit 2; 

while read pass;do
    [ -z "$pass" ] && continue;
    echo $pass | JPSEEK_STDIN=true ./jpseek $JPG output >/dev/null 2>&1;
    if [ $? -eq 0 ];then
        echo "PASSWORD: $pass"
        file output
        if [ ! $CONT_AFTER_EXIT0 ];then
            exit 0;
        fi
    fi
done < $WORDLIST

