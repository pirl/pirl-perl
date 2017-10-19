package PIRL::Action::eth_protocolVersion;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('QUAN');

    return {
        "method" => "eth_protocolVersion",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;