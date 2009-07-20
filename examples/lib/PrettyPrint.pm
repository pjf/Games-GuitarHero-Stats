package PrettyPrint;
use Moose::Role;

use constant DEFAULT_SIZE => 78;

requires 'stringify';

sub left {
    my ($this, $size) = @_;
    my $str = $this->stringify;

    $size ||= DEFAULT_SIZE;

    return sprintf("%${size}s", $str);
}

sub right {
    my ($this, $size) = @_;
    my $str = $this->stringify;

    $size ||= DEFAULT_SIZE;

    return sprintf("%-${size}s", $str);
}

sub center {
    my ($this, $size) = @_;
    my $str = $this->stringify;

    $size ||= DEFAULT_SIZE;

    my $length = length($str);

    my $padding = ($size - $length) / 2;

    return ((" " x $padding) . $str . (" " x ( $size - $length - $padding ) ));
}

*centre = \&center;

1;
