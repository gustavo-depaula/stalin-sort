use strict;
use warnings;

sub stalin_sort {
	my @arr = @_;
	my @sorted;
	my $max = 0;
	for (my $i = 0; $i <= $#arr; $i++) {
		if ($arr[$i] >= $max) {
			push(@sorted, $arr[$i]);
			$max = $arr[$i];
		}
	}
	return @sorted;
}

my @arr1 = (1, 2, 4, 3, 6, 8, 0, 9, 5, 7);
my @sorted1 = stalin_sort(@arr1);
print "Original: @arr1 \n";
print "Sorted: @sorted1 \n";

my @arr2 = (9, 8, 7, 6, 5, 4, 3, 2, 1, 0);
my @sorted2 = stalin_sort(@arr2);
print "Original: @arr2 \n";
print "Sorted: @sorted2 \n";

my @arr3 = (1, 3, 2, 5, 4, 7, 0, 9, 8, 6);
my @sorted3 = stalin_sort(@arr3);
print "Original: @arr3 \n";
print "Sorted: @sorted3 \n";
