#!/usr/bin/perl
#
#
#
#   Copyright (C) 2014 Sunao HARA (hara@okayama-u.ac.jp)
#   Copyright (C) 2014 Abe Laboratory, Okayama Univresity
#   Last Modified: 2014/07/11 11:22:25.
#
##
## ���֤Τ��ޤ��ʤ�
##
use strict;
use warnings;
use 5.10.1;
#use Data::Dumper;        # print Dumper(\@data);
#use Text::CSV::Simple;   # $p = Text::CSV::Simple->new({binary=>1}); @d = $p->read_file($filename);
#use Text::CSV_XS;        # $csv = Text::CSV_XS->new({binary=>1}); while($row = $csv->getline(IN));
#use Encode;              # Memo: euc->sjis; Encode::from_to($hoge, "ujis", "sjis");
## Encodings
#use utf8;
#use encoding "euc-jp";
#use open IO => ":encoding(euc-jp)";

##
## ������λ �ȥ�å�
##
$SIG{'INT'}=$SIG{'HUP'}=$SIG{'QUIT'}=$SIG{'TERM'}=sub { print "SIGINT!!\n"; exit; };

##
## ����
##

##
## �ܽ���
##
while(<>) {

}

