#!/bin/sh

SOURCEFOLDER=$1

docker run --rm -it --name googletest -v $SOURCEFOLDER:/tests/src duf42/googletest

# Return tests status (0 = PASSED, 1=FAILED)
echo $?