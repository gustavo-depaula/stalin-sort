use strict;
use List::Util qw(reduce);

sub stalin_sort {
    reduce { push @$a, $b unless @$a && $a->[-1] > $b; $a } [], @_;
}

my @arr1 = (1, 2, 4, 3, 6, 8, 0, 9, 5, 7);
my $sorted1 = stalin_sort(@arr1);
print "Original: @arr1 \n";
print "Sorted: @$sorted1 \n";

my @arr2 = (9, 8, 7, 6, 5, 4, 3, 2, 1, 0);
my $sorted2 = stalin_sort(@arr2);
print "Original: @arr2 \n";
print "Sorted: @$sorted2 \n";

my @arr3 = (1, 3, 2, 5, 4, 7, 0, 9, 8, 6);
my $sorted3 = stalin_sort(@arr3);
print "Original: @arr3 \n";
print "Sorted: @$sorted3 \n";
