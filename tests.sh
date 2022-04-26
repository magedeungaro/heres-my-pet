#!/bin/bash

if test -z "$1"
  then
    bundle exec rspec
  else
    echo "running tests for $1"
    bundle exec rspec spec/$1
fi
