#!/bin/bash

if test -z "$1"
  then
    shopt -s dotglob
    find spec/ -prune -type d | while IFS= read -r d; do
        echo "running test $d"
        bundle exec rspec $d
    done
  else
    echo "running test $1"
    bundle exec rspec spec/$1
fi
