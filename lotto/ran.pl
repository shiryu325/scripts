#!/usr/bin/perl

my @game1 = qw(1 39 43 44 47 10) ;
my @game2 = qw(5 24 25 34 47 3);
my @game3 = qw(1 39 43 44 47 10) ;

my $drange = 47 ;
my $mrange = 27 ;

my $i = 0  ;
do {
	my @game0 = pick() ;
	$i++ ;
	if ($i % 1000000 == 0) { 
		print "$i\t - " ;
		printGame(@game0) ;
	}

} while (@game0 !~~ @game1)  ;
print "Match game $i\t - " ;
printGame() ;

sub printGame {
	foreach(@_) {
		printf ("%02d ", $_) ;
	}
	print "\n";
}

sub pick {
	my @sort ;
	my %h ;

	for (my $i = 0 ; $i < 5 ; $i++ if (!$h{$x}++)) {
		$x = int (rand($drange) + 1) ;
	}

	for my $x ( sort {$a<=>$b} keys %h) {
		push @sort, $x ;
	}
	push @sort, int (rand($mrange) + 1) ;
	return @sort ;
}

