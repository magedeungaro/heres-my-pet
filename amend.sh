#!/bin/bash

reset=`tput sgr0`
magenta=`tput setaf 5`
blue=`tput setaf 4`
gray=`tput setaf 7`

start_time=$(date +%s.%3N)
git add $1 .

git commit -amend

branch=$(git rev-parse --abbrev-ref HEAD)

echo "${blue}Enter remote name ${gray}(default: origin)${reset}"
read remote

if test -z "$remote"
  then
        git pull origin $branch
  else
        git pull $remote $branch
fi

end_time=$(date +%s.%3N)
elapsed=$(echo "scale=3; $end_time - $start_time" | bc)
echo "${magenta}$(tput bold)Done in ${elapsed}ms ${reset}"
