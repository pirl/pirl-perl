package PIRL::Action;
use Moose;
use PIRL::Action::net_version;
use PIRL::Action::net_listening;

has 'net_id'  => (
        is      => 'ro',
        isa     => 'Int',
        default => '3125659152'
    );
1;