#!/bin/sh

set -o errexit ; set -o nounset

UP_BEGIN=$(date)

./unchange.sh

./git-pull-origin-master.sh

./all.sh

UP_END=$(date)

echo $UP_BEGIN
echo $UP_END