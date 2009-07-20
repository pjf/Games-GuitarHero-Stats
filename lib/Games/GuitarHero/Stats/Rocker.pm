package Games::GuitarHero::Stats::Rocker;
use Games::GuitarHero::Stats::Types;
use Games::GuitarHero::Stats::Performance;
use Moose;
use autodie;
use LWP::UserAgent;
use XML::Simple;
use YAML;
use Carp;

our $VERSION = '0.01';

sub BUILDARGS {
    my ($class, @args) = @_;

    if (@args % 2) {
        return $class->SUPER::BUILDARGS(@args);
    }

    my %args = @args;

    my $xml;

    if (my $file = $args{file}) {
        open(my $fh, '<', $file);

        $xml = do { local $/; <$fh> };
    }
    elsif ( my $id = $args{id} ) {

        my $ua = LWP::UserAgent->new;
        $ua->env_proxy;

        my $response = $ua->get("http://assets.community.guitarhero.com/accounts/feed/ghwt/$id.xml");

        if ($response->is_success) {
            $xml = $response->decoded_content;
        }
        else {
            croak "Failed to load guitar hero XML - "
                .  $response->status_line;
        }
    }
    else {
        croak "Missing either a 'id' or 'file' parameter";
    }

    my $data = XMLin( $xml );

    # There's an effectively useless 'primary_slot'
    # in the XML.  For now, we just partially flatten
    # our data structure.

    foreach my $key (keys %{ $data->{primary_slot} } ) {
        $data->{$key} = delete $data->{primary_slot}{$key};
    }

#        print Dump $data;

    return $data;

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

# Helper function, so we don't need 'is => "ro"' everywhere.

sub has_ro { has(shift, is => 'ro', @_) };

has_ro last_login              => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro unread_message_count    => ( isa => 'GH::Int', coerce => 1);
has_ro last_blog_post_at       => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro last_linked_slot_at     => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro groupies                => ( isa => 'GH::Int', coerce => 1 );
has_ro rocker_status           => ( isa => 'Str' );
has_ro tournament_wins         => ( isa => 'GH::Int', coerce => 1 );
has_ro last_joined_clan_at     => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro username                => ( isa => 'Str' );
has_ro last_comment_on_blog_post_at => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro description             => ( isa => 'Str' );
has_ro last_created_clan       => ( isa => 'MaybeDateTime', coerce => 1 );
has_ro skin                    => ( isa => 'Str' );

# TODO: recent performances, etc

# There's a last_login inside <primary>. Why?

has_ro name                    => ( isa => 'Str' );

# Add wins, etc.

# has highscores => (
#    isa => 'ArrayRef[Games::GuitarHero::Stats::HighScore]'
# );

if (not $ENV{NO_PERFORMANCES} ) {

    has_ro recent_performances => (
        isa => 'PerformanceArray',
        coerce => 1,
    );

}

__PACKAGE__->meta->make_immutable;

no Moose;

1;
