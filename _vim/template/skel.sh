#!/bin/sh
#
#
#
#    Copyright (C) 2016 Sunao HARA (hara@okayama-u.ac.jp)
#    Copyright (C) 2016 Abe laboratory, Okayama university
#    Last Modified: 2016/06/09 11:48:33.
#

set -e
CWD=${0%/*}
trap '[ -n "$(jobs -p)" ] && kill $(jobs -p)' EXIT

