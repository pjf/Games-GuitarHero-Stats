package Games::GuitarHero::Stats::Performance;
use Moose;
use Games::GuitarHero::Stats::Types;

# Helper function, so we don't need 'is => "ro"' everywhere.

sub has_ro { has(shift, is => 'ro', @_) };

has_ro score                => (isa => 'GH::Int', coerce => 1 );
has_ro part                 => (isa => 'Str' );
has_ro best_streak          => (isa => 'GH::Int', coerce => 1 );
has_ro stars                => (isa => 'GH::Int', coerce => 1 );
has_ro song_difficulty      => (isa => 'Str');
has_ro star_power_achieved  => (isa => 'GH::Int', coerce => 1);
has_ro venue                => (isa => 'Str');
has_ro notes_hit            => (isa => 'GH::Int', coerce => 1);
has_ro song                 => (isa => 'Str');
# has_ro created_at           => (isa => 'DateTime', coerce => 1);

__PACKAGE__->meta->make_immutable;
no Moose;
1;
