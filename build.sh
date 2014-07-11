#!/usr/bin/env bash

function check_result {
  if [ "0" -ne "$?" ]
  then
    echo $1
    exit 1
  fi
}

cd $WORKSPACE

rm -rf out/target

export BUILD_NO=$BUILD_NUMBER
unset BUILD_NUMBER

export AOKP_NIGHTLY=true
export PATH=~/bin:$PATH
export USE_CCACHE=1

. build/envsetup.sh

brunch $1
check_result "Build failed."
