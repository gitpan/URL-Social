use Test::More;

use URL::Social;

my $url = URL::Social->new(
    url => 'http://www.dagbladet.no/',
);

ok( $url->stumbleupon->view_count >= 410, 'view_count' );

done_testing;