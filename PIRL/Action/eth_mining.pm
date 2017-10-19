package PIRL::Action::eth_mining;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('BOOL');

    return {
        "method" => "eth_mining",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;