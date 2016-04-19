#!/usr/bin/perl
##############################################################################
# PACKAGE NAME:	GRID.pm
# DESCRIPTION:	support for ICCBBA GRID
# DATE WRITTEN: 2016-04-19
# WRITTEN BY:   Martin Maiers <mmaiers@nmdp.org>
##############################################################################
package GRID;
use strict;    # always
use warnings;  # or else

my $init =0;

my %I; 
sub initialize {
  foreach my $c (0..9, 'A'..'Z', '*') {
    my $i = ISO7064($c);
    $I{$i} = $c;
  } 
  $init =1;
}

sub deISO7064 {
  initialize() unless $init;
  my $i = shift;
  return $I{$i};
}

sub ISO7064 {
  my $c = shift;
  return (ord $c) - 55 if ($c=~/^[A-Z]$/);
  return 36 if $c eq '*';
  return (int $c) if ($c=~/^[0-9]$/);
  return -1;
}

sub makeGRID {
  my ($ion, $id) = @_;
  return sprintf("%04d%015s", $ion,$id);
}

sub getckd {
  my $grid = shift;
  return -1 unless length $grid == 19;
  return -1 if $grid=~/[^0-9A-Z]/;
  my $s =0;
  for (my $i=0; $i<19; $i++) {
    my $ckv = ISO7064(substr($grid, $i, 1)); 
    $s+= 2**(19-$i) * $ckv;
  }
  deISO7064(38- ($s % 37));
}
1;
