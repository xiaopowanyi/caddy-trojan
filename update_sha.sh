#!/bin/bash

url="https://api.github.com/repos/imgk/caddy-trojan/commits"
local_file="sha"
git config --local user.email "1141101853@qq.com"
git config --local user.name "xiaopowanyi"
remote_sha=$(curl -L $url | jq -r '.[0].sha')
commit_and_push() {
  git pull
  git add sha
  git commit -m "update sha"
}
if [ ! -f "$local_file" ]; then
  echo $remote_sha > $local_file
  commit_and_push
  exit 0
fi

local_sha=$(cat $local_file)

if [ "$remote_sha" != "$local_sha" ]; then
  echo $remote_sha > $local_file
  commit_and_push
fi
