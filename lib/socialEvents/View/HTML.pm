package socialEvents::View::HTML;

use strict;
use base 'Catalyst::View::TT';

__PACKAGE__->config({
    INCLUDE_PATH => [
        socialEvents->path_to( 'root', 'src' ),
        socialEvents->path_to( 'root', 'lib' )
    ],
    PRE_PROCESS  => 'config/main',
    WRAPPER      => 'site/wrapper',
    ERROR        => 'error.tt2',
    TIMER        => 0,
	render_die   => 1,
	TEMPLATE_EXTENSION => '.tt2',
});

=head1 NAME

socialEvents::View::HTML - Catalyst TTSite View

=head1 SYNOPSIS

See L<socialEvents>

=head1 DESCRIPTION

Catalyst TTSite View.

=head1 AUTHOR

fabiim,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;

