# NAME

URL::Social - Helper module for retrieving social information (likes, shares
etc.) for any given URL.

# VERSION

Version 0.01

# DESCRIPTION

This module makes it easy to extract social information like likes, shares
etc. for any given URL from the following services:

    * Facebook
    * LinkedIn
    * StumbleUpon
    * Twitter

These will be added in the near (...) future:

    * Google+
    * Pinterest

# SYNOPSIS

    use URL::Social;

    my $social = URL::Social->new(
        url => '...',
    );

    my $facebook_shares = $social->facebook->share_count;
    my $twitter_shares  = $social->twitter->share_count;
    # ...

# METHODS

head2 new( url => $url )

Returns an instance of this class. Requires `$url` as an argument;

    my $social = URL::Social->new(
        url => '...',
    );

## facebook

Returns an instance of the [URL::Social::Facebook](http://search.cpan.org/perldoc?URL::Social::Facebook) class.

## linkedin

Returns an instance of the [URL::Social::LinkedIn](http://search.cpan.org/perldoc?URL::Social::LinkedIn) class.

## stumbleupon

Returns an instance of the [URL::Social::StumbleUpon](http://search.cpan.org/perldoc?URL::Social::StumbleUpon) class.

## twitter

Returns an instance of the [URL::Social::Twitter](http://search.cpan.org/perldoc?URL::Social::Twitter) class.

# LICENSE AND COPYRIGHT

Copyright 2013 Tore Aursand.

This program is free software; you can redistribute it and/or modify it
under the terms of the the Artistic License (2.0). You may obtain a
copy of the full license at:

[http://www.perlfoundation.org/artistic\_license\_2\_0](http://www.perlfoundation.org/artistic\_license\_2\_0)

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
