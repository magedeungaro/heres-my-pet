#!/bin/bash

if test -z "$1"
  then
    echo 'running test system'
    bundle exec rspec spec/system

    echo 'running test services'
    bundle exec rspec spec/services
  else
    echo "running test $1"
    bundle exec rspec spec/$1
fi
