package PIRL::Action::eth_getTransactionByHash;
use Moose;
extends 'PIRL::Action';


has 'transactionHash'   => (
        is => 'rw',
        isa => 'Str',
        required => 1
    );

sub get_content {

    $_[0]->return_encoding('TransactionObject');

    return {
        "method" => "eth_getTransactionByHash",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->transactionHash]
    };
}

1;