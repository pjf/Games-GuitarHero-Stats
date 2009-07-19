use inc::Module::Install;

name     'Games-GuitarHero-Stats';
all_from 'lib/Games/GuitarHero/Stats.pm';
author   'Paul Fenwick <pjf@cpan.org>';

build_requires 'Test::More';

requires 'Moose';
requires 'DateTime';
requires 'DateTime::Format::Strptime';
requires 'XML::Simple';
requires 'YAML';


auto_install;

WriteAll;

