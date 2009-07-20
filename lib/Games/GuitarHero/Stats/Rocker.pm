package Games::GuitarHero::Stats::Rocker;
use Games::GuitarHero::Stats::Types;
use Games::GuitarHero::Stats::Performance;
use Moose;

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
