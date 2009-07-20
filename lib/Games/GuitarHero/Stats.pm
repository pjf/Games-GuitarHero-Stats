package Games::GuitarHero::Stats;

use 5.006;

use warnings;
use strict;

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

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 FUNCTIONS

=cut

sub new {
    my ($class, %args) = @_;

    my $id = $args{id} or croak "Mandatory id field missing";

    my $ua = LWP::UserAgent->new;
    $ua->env_proxy;

    my $response = $ua->get("http://assets.community.guitarhero.com/accounts/feed/ghwt/$id.xml");

    if ($response->is_success) {
        my $data = XMLin( $response->decoded_content);

        # There's an effectively useless 'primary_slot'
        # in the XML.  For now, we just partially flatten
        # our data structure.

        foreach my $key (keys %{ $data->{primary_slot} } ) {
            $data->{$key} = delete $data->{primary_slot}{$key};
        }

#        print Dump $data;

        return Games::GuitarHero::Stats::Rocker->new( $data );
    }
    else {
        die $response->status_line;
    }
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
