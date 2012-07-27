#!/usr/bin/perl
use strict;
use warnings;

my @funcs;
BEGIN {@funcs = qw(cat df diff rm tail) }

use Test::More tests => 1+1+@funcs;
use Test::NoWarnings;

BEGIN { use_ok "File::Tools"; }


foreach my $func (@funcs) {
  eval "File::Tools::$func()";
  is ($@, "Not implemented\n", "$func not implemented");
};
