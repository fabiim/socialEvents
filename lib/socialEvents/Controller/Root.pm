package socialEvents::Controller::Root;
use Moose;
BEGIN { extends 'Catalyst::Controller' }

use namespace::autoclean;



#
# Sets the actions in this controller to be registered with no prefix
# so they function identically to actions created in MyApp.pm
#
__PACKAGE__->config(namespace => '');

=head1 NAME

socialEvents::Controller::Root - Root Controller for socialEvents

=head1 DESCRIPTION

[enter your description here]

=head1 METHODS

=head2 index

The root page (/)

=cut

sub index :Path :Args(0) {
    my ($self, $c) = @_;
    if ($c->user_exists() ){
        $c->response->redirect( $c->uri_for('/user')); 
        $c->detach(); 
    }
    $c->stash( template => 'index.tt' ); 
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->stash(error_message => 'Page doesn\'t exist');
    $c->stash(template => 'notfound.tt'); 
    $c->response->status(404);
}

=head2 end

Attempt to render a view, if needed.

=cut

sub end : ActionClass('RenderView') {}

=head1 AUTHOR

fabiim,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
