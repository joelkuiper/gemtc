#!/bin/bash

DIR=`mktemp -d`
R CMD INSTALL -l $DIR --install-tests $1

if [[ $3 == "R2WinBUGS" ]]; then echo "HI"; export TMPDIR="$HOME/.wine/drive_c/bugstmp/"; fi

R --vanilla --slave --file=run-tests.R --args $DIR $2 $3
rm -rf $DIR
