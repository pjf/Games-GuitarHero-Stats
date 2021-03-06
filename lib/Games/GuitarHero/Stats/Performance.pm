package Games::GuitarHero::Stats::Performance;
use Moose;
use Games::GuitarHero::Stats::Types;

# Helper function, so we don't need 'is => "ro"' everywhere.

sub has_ro { has(shift, is => 'ro', @_) };

has_ro score                => (isa => 'GH::Int', coerce => 1 );
has_ro part                 => (isa => 'GH::Str', coerce => 1 );
has_ro best_streak          => (isa => 'GH::Int', coerce => 1 );
has_ro stars                => (isa => 'GH::Int', coerce => 1 );
has_ro song_difficulty      => (isa => 'Str');
has_ro star_power_achieved  => (isa => 'GH::Int', coerce => 1);
has_ro venue                => (isa => 'Str');
has_ro notes_hit            => (isa => 'GH::Int', coerce => 1);
has_ro notes_missed         => (isa => 'GH::Int', coerce => 1);
has_ro song                 => (isa => 'Str');
has_ro created_at           => (isa => 'DateTime', coerce => 1);

sub percentage_hit {
    my ($this) = @_;

    my $hits   = $this->notes_hit;
    my $misses = $this->notes_missed;

    my $total = $hits + $misses;

    return sprintf("%.1f", 100 * $hits / ( $hits + $misses ) );
}

__PACKAGE__->meta->make_immutable;
no Moose;
1;
