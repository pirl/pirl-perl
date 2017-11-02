package PIRL::Action::eth_getBlockByNumber;
use Moose;
extends 'PIRL::Action';

has 'details'   => (
        is    => 'rw',
        isa   => 'Bool',
        required => 1
    );

sub get_content {

    $_[0]->return_encoding('Object');

    my $details = $_[0]->details == 1 ? JSON::true : JSON::false;

    return {
        "method" => "eth_getBlockByNumber",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->blockNumberHash, $details]
    };
}
1;