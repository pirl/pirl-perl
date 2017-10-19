package PIRL::Action;
use Moose;
use PIRL::Action::net_version;
use PIRL::Action::net_listening;
use PIRL::Action::net_peerCount;
use PIRL::Action::eth_protocolVersion;
use PIRL::Action::eth_syncing;
use PIRL::Action::eth_coinbase;
use PIRL::Action::eth_mining;
use PIRL::Action::eth_hashrate;
use PIRL::Action::eth_gasPrice;

has 'net_id'  => (
        is      => 'ro',
        isa     => 'Int',
        default => '3125659152'
    );

has 'return_encoding'   => (
        'is'    => 'rw',
        'isa'   => 'Str',
        'default'   => 'HEX'
    );
1;