#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color
while true;
  do
    challenge=$(cat verb.txt | sed '/^$/d' | gshuf -n1 | cut -f1)
    PS3=" --- > $challenge "
    select prep in $(cat verb.txt | sed '/^$/d' | cut -f2 | uniq);
    do
      solution="$(cat < verb.txt | egrep "^$challenge" | cut -f2)"
      if [[ $solution == *$prep* ]]; then
        echo -e "${GREEN}ya!${NC}"
      else
        echo -e "${RED}nein!${NC} ${GREEN}$solution${NC} != ${RED}$prep${NC}"
      fi
      break
    done
done
