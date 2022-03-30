#!/bin/bash

echo 'running test systems'
bundle exec rspec spec/system

echo 'running test services'
bundle exec rspec spec/services
