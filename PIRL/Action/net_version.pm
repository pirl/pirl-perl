package PIRL::Action::net_version;
use Moose;
extends 'PIRL::Action';

sub get_content {

    $_[0]->return_encoding('STR');

    return {
        "method" => "net_version",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id
    };
}
1;