package PIRL::Action::eth_getUncleCountByBlockNumber;
use Moose;
extends 'PIRL::Action';



sub get_content {

    $_[0]->return_encoding('QUAN');

    return {
        "method" => "eth_getUncleCountByBlockNumber",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->blockNumber]
    };
}
1;