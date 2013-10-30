#!/bin/bash
FILENAME=$1;
convert `ls tmp_img | grep out.png | sort -n | sed 's/^/tmp_img\//' | tr '\n' ' '` -loop 0 $FILENAME;
