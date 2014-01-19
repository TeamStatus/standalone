#!/usr/bin/env bash

for p in supervisorctl; do
	command -v "$p" > /dev/null || (echo "Command $p is missing; please install it and try again"; exit 1)
done

DIR=$(dirname $0)

cd "$DIR/.."

supervisorctl -c etc/supervisord.conf shutdown