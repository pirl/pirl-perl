#!/usr/bin/perl
use strict;
use warnings;
use PIRL;

my $action = PIRL::Action::net_listening->new();
my $pirl = PIRL->new();
$pirl->action($action);
print $pirl->request()."\n";

