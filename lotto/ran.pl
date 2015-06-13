#!/usr/bin/perl

my @game1 = qw(1 39 43 44 47 10) ;
my @game2 = qw(5 24 25 34 47 3);
my @game3 = qw(1 39 43 44 47 10) ;

my $drange = 47 ;
my $mrange = 27 ;
my $prints = 1000000;

print "Draw range $drange, Mega range $mrange, printing every $prints draws:\n";
my $i = 0  ;
do {
	my @game0 = pick($drange, $mrange) ;
	$i++ ;
	if ($i % $prints == 0) { 
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
	my ($draw_range, $mega_range) = @_ ;
	my @sort ;
	my %h ;

	for (my $i = 0 ; $i < 5 ; $i++ if (!$h{$x}++)) {
		$x = int (rand($draw_range) + 1) ;
	}

	for my $x ( sort {$a<=>$b} keys %h) {
		push @sort, $x ;
	}
	push @sort, int (rand($mega_range) + 1) ;
	return @sort ;
}

