package PIRL::Action::net_peerCount;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('QUAN');

    return {
        "method" => "net_peerCount",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;