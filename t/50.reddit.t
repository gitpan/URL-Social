use Test::More;

use URL::Social;

my $url = URL::Social->new(
    url => 'http://imgur.com/a/m9ykz',
);

ok( $url->reddit->upvote_count   >= 350, 'upvote_count'   );
ok( $url->reddit->downvote_count >= 350, 'downvote_count' );
ok( $url->reddit->comment_count  >= 350, 'comment_count'  );

foreach my $post ( @{$url->reddit->posts} ) {
    ok( defined $post->comment_count, 'comment_count' );
}

$url = URL::Social->new(
    url => 'http://www.foobar.com/sdgsdfgdfgdfgdfgd/',
);

ok( $url->reddit->comment_count == 0, 'comment_count' );

done_testing;