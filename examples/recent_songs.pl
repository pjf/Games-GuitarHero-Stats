#!/usr/bin/perl
use strict;
use warnings;
use Games::GuitarHero::Stats;
use Term::Prompt;
use Text::Table;

my $hero = Games::GuitarHero::Stats->new(
	id => 777584
);
my @recent_performances = @{$hero->recent_performances};

my %orders = (
	"Song title"  => sub { $a->song        cmp $b->song },
	"Score"       => sub { $b->score       <=> $a->score },
	"Stars"       => sub { $b->stars       <=> $a->stars },
	"Instrument"  => sub { $a->part        cmp $b->part },
	"Best Streak" => sub { $b->best_streak <=> $a->best_streak },
);

## my @items = %orders->keys->sort;

my @items = sort keys %orders;

my $result = prompt(
	'm',
	{
		title            => 'Guitar Hero Recent Songs',
		prompt           => 'What sort order you like to see?',
		items            => [ @items ],
		order            => 'across',
		display_base     => 1,
		return_base      => 0,
		accept_multiple_selections => 0,
		accept_empty_selection     => 0,
		ignore_whitespace => 1,
	},
	'pick one',
	'1'
);

my $tb = Text::Table->new(
        "Song title", "Score", "Streak", "Stars", "Instrument",
);

my @sorted = sort { $orders{$items[$result]}->() }  @recent_performances;
foreach my $song (@sorted) {
	$tb->add(make_table_entry($song));
}
print "\n", $tb->title, $tb->rule('-'), $tb->body, $tb->rule('-');


sub make_table_entry {
	my $song = shift;
	return ($song->song, $song->score, $song->best_streak,
		$song->stars, $song->part);
}

