package Games::GuitarHero::Stats::Rocker;
use Moose;

has last_login              => ( isa => 'DateTime' );
has unread_message_count    => ( isa => 'Int');
has last_blog_post_at       => ( isa => 'DateTime' );   
has last_linked_slot_at     => ( isa => 'DateTime' );
has groupies                => ( isa => 'Int' );
has rocker_status           => ( isa => 'Str' );
has tournament_wins         => ( isa => 'Int' );
has last_joined_clan_at     => ( isa => 'DateTime' );
has username                => ( isa => 'Str' );
has last_comment_on_blog_post_at => ( isa => 'DateTime' );
has description             => ( isa => 'Str' );
has last_created_clan       => ( isa => 'DateTime' );
has skin                    => ( isa => 'Str' );

# TODO: recent performances, etc

# There's a last_login inside <primary>. Why?

has name                    => ( isa => 'Str' );

# Add wins, etc.

has highscores => (
    isa => 'ArrayRef[Games::GuitarHero::Stats::HighScore]'
);

no Moose;

1;
