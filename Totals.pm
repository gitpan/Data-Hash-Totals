package Data::Hash::Totals;

use warnings;
use strict;

=head1 NAME

Data::Hash::Totals - Handle hashes that are totals or counts

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';

=head1 SYNOPSIS

This module is so butt simple, but I'm tired of redoing this code over and over again.

    my %fave_stooge_votes = (
        Moe => 31,
        Larry => 15,
        Curly => 97,
        Shemp => 3,
    );

    print as_table( \%fave_stooge_votes );

prints the following:

      97 Curly
      31 Moe
      15 Larry
       3 Shemp

=cut

use Exporter 'import';
our @EXPORT_OK = qw( as_table );

=head1 EXPORTS

So far, only the C<as_table>, and you have to explicitly ask for it.

=head1 FUNCTIONS

=head2 as_table( $hashref )

Prints the contents of I<$hashref> as a table in descending value order.

=cut

sub as_table {
    my $hash = shift;

    my @lines;

    my @keys = sort { $hash->{$b} <=> $hash->{$a} } keys %$hash;

    for my $key ( @keys ) {
        push( @lines, sprintf( "%4d %s\n", $hash->{$key}, $key ) );
    }

    return @lines;
}

=head1 AUTHOR

Andy Lester, C<< <andy@petdance.com> >>

=head1 BUGS

Please report any bugs or feature requests to
C<bug-data-hash-totals@rt.cpan.org>, or through the web interface at
L<http://rt.cpan.org>.  I will be notified, and then you'll automatically
be notified of progress on your bug as I make changes.

=head1 ACKNOWLEDGEMENTS

=head1 COPYRIGHT & LICENSE

Copyright 2004 Andy Lester, All Rights Reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.

=cut

1; # End of Data::Hash::Totals
