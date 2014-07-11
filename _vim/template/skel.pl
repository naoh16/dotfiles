#!/usr/bin/perl
#
#
#
#   Copyright (C) 2014 Sunao HARA (hara@okayama-u.ac.jp)
#   Copyright (C) 2014 Abe Laboratory, Okayama Univresity
#   Last Modified: 2014/07/11 11:38:18.
#
##
## 定番のおまじない
##
use strict;
use Data::Dumper; { package Data::Dumper; sub qquote { return shift; } } $Data::Dumper::Useperl = 1;
use warnings;
use 5.10.0;

# Usage of Data::Dumper; print Dumper(\@data);
#use Text::CSV::Simple;   # $p = Text::CSV::Simple->new({binary=>1}); @d = $p->read_file($filename);
#use Text::CSV_XS;        # $csv = Text::CSV_XS->new({binary=>1}); while($row = $csv->getline(IN));
#use Encode;              # Memo: euc->sjis; Encode::from_to($hoge, "ujis", "sjis");
## Encodings
#use utf8;
#use encoding "euc-jp";
#use open IO => ":encoding(euc-jp)";

##
## 強制終了 トラップ
##
$SIG{'INT'}=$SIG{'HUP'}=$SIG{'QUIT'}=$SIG{'TERM'}=sub { print "SIGINT!!\n"; exit; };

##
## 設定
##

##
## 本処理
##
while(<>) {

}

