#!/bin/bash

while true;
  do
    challenge=$(cat verb.txt | sed '/^$/d' | gshuf -n1 | cut -f1)
    PS3=" --- > $challenge "
    select prep in $(cat verb.txt | sed '/^$/d' | cut -f2 | uniq);
    do
      solution="$(cat < verb.txt | egrep "^$challenge" | cut -f2)"
      if [[ $solution == *$prep* ]]; then
        echo 'ya!'
      else
        echo "nein! $solution != $prep"
      fi
      break
    done
done
