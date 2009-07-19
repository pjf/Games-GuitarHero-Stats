#!/usr/bin/perl -w
use strict;
use warnings;
use Test::More qw(no_plan);
use Games::GuitarHero::Stats;
use YAML;

my $hero = Games::GuitarHero::Stats->new(
    id => 777584
);

diag Dump $hero;

ok(1);
