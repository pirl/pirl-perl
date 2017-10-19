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
use PIRL::Action::eth_accounts;
use PIRL::Action::eth_blockNumber;
use PIRL::Action::eth_getBalance;
use PIRL::Action::eth_getStorageAt;

has 'address'   => (
        is  => 'rw',
        isa => 'Str'
    );

has 'block'   => (
        is  => 'rw',
        isa => 'Str',
        default => 'latest'
    );

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