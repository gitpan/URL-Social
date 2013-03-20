package URL::Social::BASE;
use Moose;
use namespace::autoclean;

use CHI;
use Digest::SHA qw( sha256_hex );
use Mojo::UserAgent;

=head1 NAME

URL::Social::BASE - Base class for the different social classes.

=head1 DESCRIPTION

You don't have to worry about what this module does; it is a helper base class
for the different social classes.

=cut

has 'url'  => ( isa => 'Str', is => 'rw', required => 1, default => '' );

has 'cache'     => ( isa => 'Object',          is => 'ro', lazy_build => 1 );
has 'useragent' => ( isa => 'Mojo::UserAgent', is => 'ro', lazy_build => 1 );

sub _build_cache {
    my $self = shift;

    return CHI->new(
        driver     => 'File',
        namespace  => 'URL-Social',
        expires_in => '3 minutes',
    );
}

sub _build_useragent {
    my $self = shift;

    return Mojo::UserAgent->new;
}

sub get_url_json {
    my $self = shift;
    my $url  = shift || $self->url;

    my $sha  = sha256_hex( $url );
    my $json = undef;

    unless ( $json = $self->cache->get($sha) ) {
        my $tx = $self->useragent->get( $url );

        if ( my $res = $tx->success ) {
            $json = $res->json;
            $self->cache->set( $sha, $json );
        }
    }

    return $json || {};
}

#
# The End
#
__PACKAGE__->meta->make_immutable;

1;

=head1 LICENSE AND COPYRIGHT

Copyright 2013 Tore Aursand.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

L<http://www.perlfoundation.org/artistic_license_2_0>

Any use, modification, and distribution of the Standard or Modified
Versions is governed by this Artistic License. By using, modifying or
distributing the Package, you accept this license. Do not use, modify,
or distribute the Package, if you do not accept this license.

If your Modified Version has been derived from a Modified Version made
by someone other than you, you are nevertheless required to ensure that
your Modified Version complies with the requirements of this license.

This license does not grant you the right to use any trademark, service
mark, tradename, or logo of the Copyright Holder.

This license includes the non-exclusive, worldwide, free-of-charge
patent license to make, have made, use, offer to sell, sell, import and
otherwise transfer the Package with respect to any patent claims
licensable by the Copyright Holder that are necessarily infringed by the
Package. If you institute patent litigation (including a cross-claim or
counterclaim) against any party alleging that the Package constitutes
direct or contributory patent infringement, then this Artistic License
to you shall terminate on the date that such litigation is filed.

Disclaimer of Warranty: THE PACKAGE IS PROVIDED BY THE COPYRIGHT HOLDER
AND CONTRIBUTORS "AS IS' AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES.
THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR
PURPOSE, OR NON-INFRINGEMENT ARE DISCLAIMED TO THE EXTENT PERMITTED BY
YOUR LOCAL LAW. UNLESS REQUIRED BY LAW, NO COPYRIGHT HOLDER OR
CONTRIBUTOR WILL BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, OR
CONSEQUENTIAL DAMAGES ARISING IN ANY WAY OUT OF THE USE OF THE PACKAGE,
EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.