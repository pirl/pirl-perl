package PIRL;
use Moose;
use LWP::UserAgent;
use JSON;
use PIRL::Action;
use PIRL::Helper;
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
    my $post_content = encode_json($params);

    $ua->default_header( 'Content-Type' => 'application/json' );
    my $resp = $ua->post('http://'.$_[0]->hostname.':'.$_[0]->port, Content => $post_content);
    if($resp->is_success) {

        my $content = from_json($resp->decoded_content());

 print Dumper ($content);

        my $helper = PIRL::Helper->new(node_result => $content);
        my $return = $helper->get_return($_[0]->action->return_encoding);

        print Dumper $return;

        ###TODO Auslagern

    } else {

        warn $resp->decoded_content();
        warn $resp->status_line;
    }
}

1;

