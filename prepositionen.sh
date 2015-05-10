#!/bin/bash

#!/bin/bash

#script to manage elasticsearch rake tasks in an interactive way

message="Präpositionen $ip"

echo $message
while true;
  do
    challenge=$(cat verb.txt | sed '/^$/d' | gshuf -n1 | cut -f1)
    echo "?: $challenge"
    select prep in $(cat prep.txt);
    do
      echo "You picked $prep"
      solution="$(cat < verb.txt | egrep "^$challenge" | cut -f2)"
      if [[ $prep = $solution ]]; then
        echo 'ya!'
      else
        echo "nein! solution is $solution"
      fi
      break
    done
done
