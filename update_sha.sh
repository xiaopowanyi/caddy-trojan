#!/bin/bash

url="https://api.github.com/repos/imgk/caddy-trojan/commits"
local_file="sha"

remote_sha=$(curl -L $url | jq -r '.[0].sha')

if [ ! -f "$local_file" ]; then
  echo $remote_sha > $local_file
  exit 0
fi

local_sha=$(cat $local_file)

if [ "$remote_sha" != "$local_sha" ]; then
  echo $remote_sha > $local_file
fi
