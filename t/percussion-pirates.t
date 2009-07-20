#!/usr/bin/perl -w
use strict;
use warnings;
use Test::More tests => 4;
use Games::GuitarHero::Stats;
use YAML;

my $hero = Games::GuitarHero::Stats->new(
    id => 777584
);

is($hero->rocker_status,   "Indie",              "Have we joined a guild?");
is($hero->tournament_wins, 0,                    "Do we still suck?");
is($hero->username,        "Teellox",            "Username");
#is($hero->description,     "Yarr! It be a fine day fer strumming.", "Description");
is($hero->name,            "Percussion Pirates", "Band name");
#is($hero->platform,        "wii",                "Platform");

diag Dump $hero;
