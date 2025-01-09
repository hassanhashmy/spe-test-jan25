#!/usr/bin/env bash

docker ps -q --filter name=web | wc -l

if [ $? -eq 0 ]; then
  echo "Container is running."
else
  echo "Container is not running."
fi
