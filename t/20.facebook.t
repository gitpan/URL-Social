use Test::More;

use URL::Social;

my $url = URL::Social->new(
    url => 'http://e24.no/naeringsliv/innovasjon-norge-deler-ut-milliarder-har-ingen-konkurs-oversikt/20337046',
);

ok( $url->facebook->share_count   >= 173, 'share_count'   );
ok( $url->facebook->like_count    >= 213, 'like_count'    );
ok( $url->facebook->comment_count >= 149, 'comment_count' );
ok( $url->facebook->click_count   >=   0, 'click_count'   );
ok( $url->facebook->total_count   >= 535, 'total_count'   );

done_testing;