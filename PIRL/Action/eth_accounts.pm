package PIRL::Action::eth_accounts;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('ArrayOfDATA');

    return {
        "method" => "eth_accounts",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;