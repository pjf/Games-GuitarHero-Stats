package Games::GuitarHero::Stats::Rocker;
use Games::GuitarHero::Stats::Types;
use Moose;

has last_login              => ( isa => 'MaybeDateTime', coerce => 1 );
has unread_message_count    => ( isa => 'GH::Int', coerce => 1);
has last_blog_post_at       => ( isa => 'MaybeDateTime', coerce => 1 );
has last_linked_slot_at     => ( isa => 'MaybeDateTime', coerce => 1 );
has groupies                => ( isa => 'GH::Int', coerce => 1 );
has rocker_status           => ( isa => 'Str' );
has tournament_wins         => ( isa => 'GH::Int', coerce => 1 );
has last_joined_clan_at     => ( isa => 'MaybeDateTime', coerce => 1 );
has username                => ( isa => 'Str' );
has last_comment_on_blog_post_at => ( isa => 'MaybeDateTime', coerce => 1 );
has description             => ( isa => 'Str' );
has last_created_clan       => ( isa => 'MaybeDateTime', coerce => 1 );
has skin                    => ( isa => 'Str' );

# TODO: recent performances, etc

# There's a last_login inside <primary>. Why?

has name                    => ( isa => 'Str' );

# Add wins, etc.

# has highscores => (
#    isa => 'ArrayRef[Games::GuitarHero::Stats::HighScore]'
# );

no Moose;

1;
