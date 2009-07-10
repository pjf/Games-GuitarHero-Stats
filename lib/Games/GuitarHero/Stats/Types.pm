package Games::GuitarHero::Stats::Types;

use Moose::Util::TypeConstraints;
use DateTime;
use DateTime::Format::Natural;

class_type 'DateTime';

subtype 'MaybeDateTime' => as 'Maybe[DateTime]';
subtype 'GH::Int'       => as 'Int';

coerce 'MaybeDateTime' => from 'HashRef' => via { 
    warn "\n\n\n*** COERCING DATETIME ***\n\n\n";
    if ($_->{nil} eq "true") { return undef; }
    return DateTime::Format::Natural->new->parse_datetime($_->{content})
};

coerce 'GH::Int' => from 'HashRef' => via {
    warn "\n\n\n*** COERCING INT ***\n\n\n";
    return $_->{content};
};

1;
