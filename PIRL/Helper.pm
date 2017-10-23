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

    die Dumper $content->{'result'};

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
    } else {
        return 'false';
    }
}

1;