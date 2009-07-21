#!/usr/bin/perl -w
use strict;
use warnings;
use Test::More tests => 5;
use Games::GuitarHero::Stats;
use YAML;

my $hero = Games::GuitarHero::Stats->new(
    file => 't/data/777584.xml',
);

is($hero->rocker_status,   "Indie",              "Have we joined a guild?");
is($hero->tournament_wins, 0,                    "Do we still suck?");
is($hero->username,        "Teellox",            "Username");
#is($hero->description,     "Yarr! It be a fine day fer strumming.", "Description");
is($hero->name,            "Percussion Pirates", "Band name");
#is($hero->platform,        "wii",                "Platform");

my $performances = $hero->recent_performances;

is($performances->[0]->percentage_hit, '90.6', "Percent hit check");

diag(Dump $hero) if $ENV{DEBUG};
diag($hero->recent_performances->[0]->song) if $ENV{DEBUG};
