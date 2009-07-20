#!/usr/bin/perl -w
use 5.010;
use strict;
use warnings;
use autodie;
use lib 'lib';
use lib '../lib';

use PrettyRocker;

my $file = "../t/data/777584.xml";

my $rockstar = PrettyRocker->new(
    file => $file,
);

say $rockstar->left;
say $rockstar->center;
say $rockstar->right;
