package PIRL::Action::eth_sendRawTransaction;
use Moose;
extends 'PIRL::Action';

###TODO

sub get_content {

    $_[0]->return_encoding('DATA');

    return {
        "method" => "eth_sendRawTransaction",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->address, $_[0]->blockNumber]
    };
}
1;