#!/usr/bin/perl

my $format = 0;
for (my $i = 0; $i < @ARGV; ++$i) {
    my $a = $ARGV[$i];
    if ($a eq '-d') {
	splice @ARGV, $i, 1;
	$format = 1;
    } elsif ($a eq '-l') {
	splice @ARGV, $i, 1;
	$format = 2;
    }
}

my %hash;
while (<>) {
    chomp;
    next if /^#/;
    next if /^\s+$/;
    my @array = split "\t";
    my $ch = shift @array;
    for my $k (@array) {
	$hash{$k} .= $ch;
    }
}

binmode STDOUT;
if ($format == 0) {
    printf <<SCRIPT_END
" key_exchange.pl generate this file.  Don't edit.
if !exists('*AmbsearchAdd') | finish | endif
scriptencoding cp932
SCRIPT_END
}
my @k = sort keys %hash;
for my $k (@k) {
    my $k_out = $k =~ /[a-zA-Z0-9_]/ ? $k : unpack('c', $k);
    my $k_out2 = $k eq "'" ? '"'.$k.'"' : "'".$k."'";
    my $l_out = $hash{$k};
    if ($format == 1) {
	printf "call s:SetDefaultList(%s, '%s')\n", $k_out2, $l_out;
    } elsif ($format == 2) {
	printf "let ambsearch_for_%s = '%s'\n", $k_out, $l_out;
    } else {
	printf "call AmbsearchAdd(%s, '%s')\n", $k_out2, $l_out;
    }
}
