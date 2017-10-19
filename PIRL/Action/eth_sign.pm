package PIRL::Action::eth_sign;
use Moose;
extends 'PIRL::Action';

has 'message' => (
    is  => 'rw',
    isa => 'Str',
    required => 1
);


sub get_content {

    $_[0]->return_encoding('DATA');

    my $message = $_[0]->message;
    $message =~ s/(.)/sprintf("%x",ord($1))/eg;
    $message = '0x'.$message;

    return {
        "method" => "eth_sign",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->address, $message]
    };
}
1;