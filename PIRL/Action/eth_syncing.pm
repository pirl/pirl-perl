package PIRL::Action::eth_syncing;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('Object|Boolean');

    return {
        "method" => "eth_syncing",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;