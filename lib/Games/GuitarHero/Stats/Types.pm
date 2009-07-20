package Games::GuitarHero::Stats::Types;

use Moose::Util::TypeConstraints;
use DateTime;
use DateTime::Format::Strptime;
use YAML;
use Games::GuitarHero::Stats::Performance;

class_type 'DateTime';

subtype 'MaybeDateTime'    => as 'Maybe[DateTime]';
subtype 'GH::Int'          => as 'Int';
subtype 'PerformanceArray' => as 'ArrayRef[Games::GuitarHero::Stats::Performance]';

my $strptime = DateTime::Format::Strptime->new(
    pattern => '%FT%TZ',
    time_zone => 'GMT',
);

coerce 'DateTime' => from 'HashRef' => via {
    return $strptime->parse_datetime($_->{content})
};

coerce 'MaybeDateTime' => from 'HashRef' => via { 
    if ($_->{nil}||"" eq "true") { return undef; }
    return $strptime->parse_datetime($_->{content})
};

coerce 'GH::Int' => from 'HashRef' => via {
    warn "Coercing $_->{content}\n";
    return $_->{content};
};

coerce 'PerformanceArray' => from 'HashRef' => via {
    my $raw = $_;

    my @performances;

    my $i = 1;

    while ( my $perf_data = $raw->{"performance_$i"} ) {
        warn Dump $perf_data;
        push(
            @performances,
            Games::GuitarHero::Stats::Performance->new($perf_data)
        );
        warn $performances[-1]->song;
    }

    print Dump \@performances;

    return \@performances;
};

1;
