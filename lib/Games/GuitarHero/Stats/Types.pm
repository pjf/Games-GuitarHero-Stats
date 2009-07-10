package Games::GuitarHero::Stats::Types;

use Moose::Util::TypeConstraints;
use DateTime;
use DateTime::Format::Strptime;

class_type 'DateTime';

subtype 'MaybeDateTime' => as 'Maybe[DateTime]';
subtype 'GH::Int'       => as 'Int';

my $strptime = DateTime::Format::Strptime->new(
    pattern => '%FT%TZ',
    time_zone => 'GMT',
);


coerce 'MaybeDateTime' => from 'HashRef' => via { 
    if ($_->{nil}||"" eq "true") { return undef; }
    return $strptime->parse_datetime($_->{content})
};

coerce 'GH::Int' => from 'HashRef' => via {
    return $_->{content};
};

1;
