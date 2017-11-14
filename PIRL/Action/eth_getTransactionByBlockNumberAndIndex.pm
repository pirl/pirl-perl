package PIRL::Action::eth_getTransactionByBlockNumberAndIndex;
use Moose;
extends 'PIRL::Action';


has 'transactionIndex'   => (
        is => 'rw',
        isa => 'Int',
        required => 0,
        trigger => \&transactionIndex_to_hex
    );
has 'transactionIndexHash' => (
        is => 'rw',
        isa => 'Str'
    );

sub get_content {

    $_[0]->return_encoding('TransactionObject');

    return {
        "method" => "eth_getTransactionByBlockNumberAndIndex",
        "jsonrpc"   => "2.0",
        "id"    => $_[0]->net_id,
        "params" => [$_[0]->blockNumberHash, $_[0]->transactionIndexHash]
    };
}

sub transactionIndex_to_hex {
    my($self, $index) = @_;
    #print "index: ".$index."\n";
    $self->transactionIndexHash(sprintf("0x%x",$index));
    #print "hashindex: ".$self->transactionIndexHash."\n";
}

1;