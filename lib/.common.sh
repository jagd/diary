#!/bin/sh
#
# This file should be source'd.
#
# Usage:
#   day_desc="next Tue" . "$DIARY_INSTALL/.common.sh" || die
#   A sourced script cannot take argument (in dash)
#
# Input:
#   Env var $day_desc as the DATE to be operated
#   Today if empty
#
# Output:
#   $diary_day (in form 2020-12-24)
#   $diary_folder
#   $diary_basename
#   $diary_file
#   Also, $EDITOR is set if empty.
#
# Environment variable:
#   $DIARY_ROOT
#
#=Examples of DATE DESCRIPTION:
#=    2020-12-24
#=    tomorrow
#=    yesterday
#=    "last Thursday"  (works also without quote)
#=    next Thursday
#=    Sun              (Short form)
#=    next Sun
#=    2 days
#=    3 days ago
#

die() {
     echo $*
     exit 1
}

if [ -z "$DIARY_ROOT" ] ; then
    die "DIARY_ROOT not set"
fi

if [ -z "$day_desc" ] ; then
    diary_day=today
else
    diary_day=`date -d "$day_desc" +'%Y-%m-%d' 2> /dev/null`
    if [ -z "$diary_day" ] ; then
        die "Invalid date description '$day_desc'"
    fi
fi

diary_file=$DIARY_ROOT/`date -d "$diary_day" +'%Y/%m/%d.md'`
diary_basename=`basename "$diary_file"`
diary_folder=`dirname "$diary_file"`
mkdir -p "$diary_folder" || die "Failed to create folder $diary_folder"

if [ -z "$EDITOR" ]; then
    EDITOR=vi
fi

