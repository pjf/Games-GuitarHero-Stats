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

# Helper function, so we don't need 'is => "ro"' everywhere.

sub has_ro { has(shift, is => 'ro', @_) };

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

has_ro name                    => ( isa => 'Str' );

# Add highscores, etc.

# has highscores => (
#    isa => 'ArrayRef[Games::GuitarHero::Stats::HighScore]'
# );

has_ro recent_performances => (
    isa => 'PerformanceArray',
    coerce => 1,
);

__PACKAGE__->meta->make_immutable;

no Moose;

1;
