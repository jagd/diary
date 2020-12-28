#!/usr/bin/env bash

_diary () {
    local cur
    cur=${COMP_WORDS[COMP_CWORD]}
    if [ "$COMP_CWORD" -eq 1 ] ; then
        COMPREPLY=(`compgen -W 'edit export git schedule todo -h --help' -- "$cur"`)
        if [ -n "$COMPREPLY" ]; then
            return 0
        fi
    fi
    COMPREPLY=(`compgen -W 'ago yesterday tomorrow day days Monday Tuesday Wednesday Thursday Friday Saturday Sunday month months year years' -- "$cur"`)
}
complete -F _diary diary
