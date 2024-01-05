#!/usr/bin/perl
#
#
#
#   Copyright (C) 2016 Sunao HARA (hara@okayama-u.ac.jp)
#   Copyright (C) 2016 Abe Laboratory, Okayama Univresity
#   Last Modified: 2016/06/09 11:48:22.
#
use strict;
#use Data::Dumper; { package Data::Dumper; sub qquote { return shift; } } $Data::Dumper::Useperl = 1;
use warnings;
use 5.10.0;
## Encodings
#use utf8;
#use encoding "euc-jp";
#use open IO => ":encoding(euc-jp)";
#binmode STDOUT, ":utf8";

## 強制終了 トラップ
$SIG{'INT'}=$SIG{'HUP'}=$SIG{'QUIT'}=$SIG{'TERM'}=sub { print "SIGINT!!\n"; exit; };

##
## 設定
##

##
## 本処理
##
while(<>) {

}

