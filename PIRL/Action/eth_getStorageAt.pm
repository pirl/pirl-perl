package PIRL::Action::eth_getStorageAt;
use Moose;
extends 'PIRL::Action';

###TODO

sub get_content {

    $_[0]->return_encoding('DATA');

    return {
        "method" => "eth_getStorageAt",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;