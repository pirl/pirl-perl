package PIRL;
use Moose;
use LWP::UserAgent;
use JSON;
use PIRL::Action;
use Data::Dumper;
use Math::BigInt;

has 'action'		=> (
        is	=> 'rw',
        isa	=> 'PIRL::Action'
    );

has 'hostname'  => (
        is => 'rw',
        isa => 'Str',
        default => 'localhost'
    );

has 'port'  => (
        is => 'rw',
        isa => 'Int',
        default => '6588'
    );


sub request {

    my $params = $_[0]->action->get_content;

    my $ua = LWP::UserAgent->new();
    my $post_content = to_json($params);
    $ua->default_header( 'Content-Type' => 'application/json' );
    my $resp = $ua->post('http://'.$_[0]->hostname.':'.$_[0]->port, Content => $post_content);
    if($resp->is_success) {

        my $content = from_json($resp->decoded_content());

 print Dumper ($content);

        ###TODO Auslagern
        if ($content->{'result'}) {
            if($_[0]->action->return_encoding eq 'QUAN') {

                #$content->{'result'} =~ s/^0x(.*?)$/$1/;
                #$content->{'result'} = '0'.$content->{'result'} if length($content->{'result'}) == 1;

                my $big_int = Math::BigInt->from_hex($content->{'result'});

                if(scalar(@{$big_int->{'value'}}) > 1) {
                    my $return = $big_int->{'value'}[2] . ',' . $big_int->{'value'}[1];
                    return $return;
                } else {
                    return $big_int->{'value'}[0];
                }
            }
            elsif($_[0]->action->return_encoding eq 'DATA') {
                return $content->{'result'};
            }
            elsif($_[0]->action->return_encoding eq 'ArrayOfDATA') {
my @return = @{$content->{'result'}};
                #die Dumper @return;
                return \@return;
            }
            elsif($_[0]->action->return_encoding eq 'Object|Boolean') {
                ###TODO eth_syncing
                die $content->{'result'};
                if($content->{'result'} == 0) {
                    return 'false';
                } else {
                    die;
                    return $content->{'result'}; ###TODO
                }
            }
            elsif($_[0]->action->return_encoding eq 'STR') {
                return $content->{'result'};
            }
            elsif($_[0]->action->return_encoding eq 'BOOL') {
                return 'true' ? $content->{'result'} == 1 : 'false';
            }
        } else {
            return 'false';
        }
    } else {

        warn $resp->decoded_content();
        warn $resp->status_line;
    }
}

1;

