package PIRL::Helper;
use Data::Dumper;
use Moose;

has 'node_result'   => (
        is  => 'rw',
        isa => 'HashRef',
        required => 1
    );

sub get_return {
    my ($self, $return_encoding) = @_;
    my $content = $self->node_result;

#    die Dumper $content->{'result'};

    if ($content->{'result'}) {
        if($return_encoding eq 'QUAN') {

            my $big_int = Math::BigInt->from_hex($content->{'result'});

            if(scalar(@{$big_int->{'value'}}) > 1) {
                my $return = $big_int->{'value'}[2] . ',' . $big_int->{'value'}[1];
                return $return;
            } else {
                return $big_int->{'value'}[0];
            }
        }
        elsif($return_encoding eq 'DATA') {
            return $content->{'result'} eq '0x' ? '0' : $content->{'result'};
        }
        elsif($return_encoding eq 'ArrayOfDATA') {
            my @return = @{$content->{'result'}};

            return \@return;
        }
        elsif($return_encoding eq 'Object|Boolean') {
            ###TODO eth_syncing

            if($content->{'result'} == 0) {
                return 'false';
            } else {
                die;
                return $content->{'result'}; ###TODO
            }
        }
        elsif($return_encoding eq 'STR') {
            return $content->{'result'};
        }
        elsif($return_encoding eq 'BOOL') {
            return 'true' ? $content->{'result'} == 1 : 'false';
        }
        elsif($return_encoding eq 'HashObject') {
            my $return = {
                'number'  => $self->get_bigHex($content->{'result'}->{'number'}),
                'hash' => $content->{'result'}->{'hash'} eq '0x' ? '0' : $content->{'result'}->{'hash'},
                'parentHash'  => $content->{'result'}->{'parentHash'} eq '0x' ? '0' : $content->{'result'}->{'parentHash'},
                'nonce' => $self->get_bigHex($content->{'result'}->{'nonce'}),
                'sha3Uncles'  => $content->{'result'}->{'sha3Uncles'},
                'logsBloom'   => $content->{'result'}->{'logsBloom'},
                'transactionRoot' => $content->{'result'}->{'transactionRoot'},
                'stateRoot'   => $content->{'result'}->{'stateRoot'},
                'receiptsRoot' => $content->{'result'}->{'receiptsRoot'},
                'miner'   => $content->{'result'}->{'miner'},
                'difficulty' => $self->get_bigHex($content->{'result'}->{'difficulty'}),
                'totalDifficulty' => $self->get_bigHex($content->{'result'}->{'totalDifficulty'}),
                'extraData'   => $content->{'result'}->{'extraData'},
                'size'    => $self->get_bigHex($content->{'result'}->{'size'}),
                'gasLimit'    => $self->get_bigHex($content->{'result'}->{'gasLimit'}),
                'gasUsed' => $self->get_bigHex($content->{'result'}->{'gasUsed'}),
                'timestamp' => $self->get_bigHex($content->{'result'}->{'timestamp'}),
                'transactions'    => $content->{'result'}->{'transactions'}, ###TODO###
                'uncles' => $content->{'result'}->{'uncles'}
            };

            return $return;
        }
        elsif($return_encoding eq 'TransactionObject') {
            my $return = {
                'hash' => $content->{'result'}->{'hash'} eq '0x' ? '0' : $content->{'result'}->{'hash'},
                'nonce' => => $self->get_bigHex($content->{'result'}->{'nonce'}),
                'blockHash' => $content->{'result'}->{'blockHash'} eq '0x' ? '0' : $content->{'result'}->{'blockHash'},
                'blockNumber'  => $self->get_bigHex($content->{'result'}->{'blockNumber'}),
                'transactionIndex' => $self->get_bigHex($content->{'result'}->{'transactionIndex'}),
                'from' => $content->{'result'}->{'from'},
                'to'    => $content->{'result'}->{'to'},
                'value' => $self->get_bigHex($content->{'result'}->{'value'}),
                'gasPrice' => $self->get_bigHex($content->{'result'}->{'gasPrice'}),
                'gas'   => $self->get_bigHex($content->{'result'}->{'gas'}),
                'data'  => $content->{'result'}->{'data'}
            };
        }
    } else {
        return 'false';
    }
}

sub get_bigHex($) {
    my($self, $hex) = @_;

    my $big_int = Math::BigInt->from_hex($hex);

    return $big_int->numify();

}


1;