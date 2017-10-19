package PIRL::Action::eth_coinbase;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('DATA');

    return {
        "method" => "eth_coinbase",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;