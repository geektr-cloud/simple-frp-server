#!/bin/bash

echo "input service group name: (default: frp-host)"

read group_name

if [[ -z "$group_name" ]]; then
  group_name=frp-host
fi

echo "input service service name:"

read service_name

if [[ -z "$service_name" ]]; then
  printf '%s\n' "No input entered"
  exit 1
fi

service_dir=/srv/${group_name}/${service_name}

if [ -d "$service_dir" ]; then
  printf '%s\n' "Directory already existed"
  exit 1
fi

mkdir -p "$service_dir"

pushd "$service_dir"

git clone --depth=1 https://github.com/geektr-cloud/simple-frp-server.git "$service_dir"

echo "cd $service_dir"
