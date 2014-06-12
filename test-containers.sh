#!/bin/bash

touch build-output/docker-build-$(date +"%F-%T").out
LOGFILE="build-output/docker-build-$(date +"%F-%T").out"

for DIRECTORY in $(ls); do
	pushd $DIRECTORY
	echo "You are now building the: ${DIRECTORY#*/} dockerfile"
	docker build -t ${DIRECTORY#*/}/test . |tee $LOGFILE
	echo "$?" >> $LOGFILE
	popd
done
