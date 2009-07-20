package Games::GuitarHero::Stats;

use 5.006;

use warnings;
use strict;
use autodie;

use LWP::UserAgent;
use XML::Simple;
use YAML;
use Games::GuitarHero::Stats::Rocker;
use Games::GuitarHero::Stats::Performance;
use Games::GuitarHero::Stats::Types;
use Carp;

=head1 NAME

Games::GuitarHero::Stats - The great new Games::GuitarHero::Stats!

=head1 VERSION

Version 0.01

=cut

our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use Games::GuitarHero::Stats;

    my $foo = Games::GuitarHero::Stats->new();
    ...

=head1 FUNCTIONS

=cut

# Just an alias for Rocker->new

sub new {
    my ($class, @args) = @_;

    return Games::GuitarHero::Stats::Rocker->new( @args );

}

=head1 AUTHOR

Paul Fenwick, C<< <pjf at cpan.org> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-games-guitarhero-stats at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=Games-GuitarHero-Stats>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc Games::GuitarHero::Stats


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=Games-GuitarHero-Stats>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/Games-GuitarHero-Stats>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/Games-GuitarHero-Stats>

=item * Search CPAN

L<http://search.cpan.org/dist/Games-GuitarHero-Stats>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Paul Fenwick, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of Games::GuitarHero::Stats
