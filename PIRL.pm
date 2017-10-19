package PIRL;
use Moose;
use LWP::UserAgent;
use JSON;
use PIRL::Action;
use Data::Dumper;

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

 print Dumper ($content->{'result'});

        ###TODO Auslagern
        if ($content->{'result'}) {

            if($_[0]->action->return_encoding eq 'QUAN') {

                $content->{'result'} =~ s/^0x(.*?)$/$1/;
                $content->{'result'} = '0'.$content->{'result'} if length($content->{'result'}) == 1;

                return hex($content->{'result'});
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

