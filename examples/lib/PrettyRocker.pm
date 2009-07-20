package PrettyRocker;
use Moose;
use PrettyPrint;

extends 'Games::GuitarHero::Stats::Rocker';
with 'PrettyPrint';

sub stringify {
    my ($this) = @_;

    return $this->name;
}

no Moose;
