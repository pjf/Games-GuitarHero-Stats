package Games::GuitarHero::Stats::HighScore;
use Moose;

has id => (isa => 'Str');           # Crappy XML name
has difficulty => (isa => 'Str');
has score => ( isa => 'Int' );
has part => ( isa => 'Str' );
has updated_at => ( isa => 'DateTime' );
has best_streak => (isa => 'Int' );
has hit_percentage => ( isa => 'Int' );

no Moose;
1;
