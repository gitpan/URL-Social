use Test::More;

use URL::Social;

my $url = URL::Social->new(
    url => 'http://e24.no/naeringsliv/innovasjon-norge-deler-ut-milliarder-har-ingen-konkurs-oversikt/20337046',
);

ok( $url->twitter->share_count >= 47, 'share_count' );

done_testing;