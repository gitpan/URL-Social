use Test::More;

use URL::Social;

my $url = URL::Social->new(
    url => 'http://www.dagbladet.no/',
);

ok( $url->linkedin->share_count >= 158, 'share_count' );

done_testing;