package PIRL::Action::net_listening;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('BOOL');

    return {
        "method" => "net_listening",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;