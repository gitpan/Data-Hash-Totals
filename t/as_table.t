#!perl -T

use strict;
use Test::More tests => 2;

BEGIN {
    use_ok( 'Data::Hash::Totals', qw( as_table ) );
}

my %fave_stooge_votes = (
    Moe => 31,
    Larry => 15,
    Curly => 97,
    Shemp => 3,
);

my @lines = as_table( \%fave_stooge_votes );
my @expected = <DATA>;
is_deeply( \@lines, \@expected );

__DATA__
  97 Curly
  31 Moe
  15 Larry
   3 Shemp
