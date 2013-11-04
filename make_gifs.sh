#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
FILENAME=$1;
convert `ls $DIR/tmp_img | grep out.png | sort -n | sed "s;^;$DIR/tmp_img/;" | tr '\n' ' ';` -loop 0 $FILENAME;
