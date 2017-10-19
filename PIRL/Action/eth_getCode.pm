package PIRL::Action::eth_getCode;
use Moose;
extends 'PIRL::Action';



sub get_content {

    $_[0]->return_encoding('DATA');

    return {
        "method" => "eth_getCode",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->address, $_[0]->blockNumber]
    };
}
1;