#! /bin/bash
DIR=$1

if [ -z "$DIR" ]; then
        DIR=.
fi

git -C "$DIR" fetch
HEADHASH=$(git -C "$DIR" rev-parse HEAD)
REMOTEHASH=$(git -C "$DIR" rev-parse $(git -C "$DIR" branch --show-current)@{upstream})
if [ "$HEADHASH" != "$REMOTEHASH" ]; then
  echo "Update found!"
        echo "$HEADHASH -> $REMOTEHASH"
        exit 0
  #git pull
else
        echo "No update found."
        exit 1
fi
exit 1