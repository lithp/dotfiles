#!/usr/bin/env bash

JRNL=/home/brian/.local/bin/jrnl

LAST_ENTRY=`$JRNL default --export json -n1 | jq -r '.entries[0] | (.date + " " + .time)'`
LAST_ENTRY=`date -d "$LAST_ENTRY" +%s`
DELTA=$((`date +%s` - $LAST_ENTRY))
MINS=$((DELTA/60))

if [ "$MINS" -gt "15" ]
then
  printf "<span color='red'>jrnl: %02d</span>\n" $MINS
else
  printf "jrnl: %02d\n" $MINS
fi
