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
use PIRL::Action::eth_getTransactionCount;
use PIRL::Action::eth_getBlockTransactionCountByHash;
use PIRL::Action::eth_getBlockTransactionCountByNumber;
use PIRL::Action::eth_getUncleCountByBlockHash;
use PIRL::Action::eth_getUncleCountByBlockNumber;
use PIRL::Action::eth_getCode;
use PIRL::Action::eth_sign;
use PIRL::Action::eth_sendTransaction;
use PIRL::Action::eth_sendRawTransaction;
use PIRL::Action::eth_call;
use PIRL::Action::eth_estimateGas;
use PIRL::Action::eth_getBlockByHash;
use PIRL::Action::eth_getBlockByNumber;


has 'address'   => (
        is  => 'rw',
        isa => 'Str'
    );

has 'blockNumber'   => (
        is  => 'rw',
        isa => 'Str',
        default => 'latest'
        ###TODO Trigger auf HEX Function
    );

has 'blockHash'   => (
        is  => 'rw',
        isa => 'Str'
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