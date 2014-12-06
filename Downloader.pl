#!/usr/bin/perl
#
# TODO

use strict ;

die "Usage: $0 url\n" if @ARGV < 1 ;
my $url = pop(@ARGV);

# Directory Options
my $WGET = "/usr/bin/wget" ;
my $DIR = "/home/voltron/pod" ;
my $LOG = "/home/voltron/Prog/log.txt"  ;

# Code
(my $file = $url) =~ s/(https?):\/\/(.*)\/(.*)(.mp3)(.*)/$2$3/ ;

unless ( -e "$DIR/$file" ) {
	print "*** Downloading $file...\n";
	my @FETCH = ($WGET, $url, "-O", "$DIR/$file" , "--append-output=$LOG" , "--progress=bar" ) ;
	push (@FETCH,"--no-check-certificate")  if ( lc($1) eq "https" ) ;
	system(@FETCH) ;
}
else {
	print "*** $file exists, skipping...\n";
}

print "\n" ; 
