package socialEvents::Controller::User;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }
use socialEvents::Form::Login;

has 'form' => ( isa => 'socialEvents::Form::Login' , is => 'rw' , lazy => 1 , default => sub { socialEvents::Form::Login->new }) ; 

=head1 NAME

socialEvents::Controller::User - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

 sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( template => 'user/index.tt') ; 
    if ( !$c-> user_exists() ) {
        $c->forward('login');         
    }
}

sub login :Local :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( template => 'user/login.tt' , 
               form => $self->form ) ; 
    return unless $self->form->process( $ c->req->params ); 
    
    if ($c->authenticate( { usr => $self->form->value->{user},  pwd => $c->req->params->{'password'}  , activo => ['1']})){
	$c->stash->{'message'} = "You are now logged in."; 
  
#Change the state of logged in user in database. 
  my $user = $c->user->get_object(); 
  $user->update( { login => '1'} ); 
	$c->response->redirect( $c->uri_for($c->controller('User')->action_for('index') )) ; 
  
	$c->detach(); 
	return;
    }
    
    else {
        $c->stash->{'message'} = "Não foi possível efectuar o login" ;
    }

    
}

sub logout :Local :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash->{'template'} = 'user/logout.tt';
    my $user = $c->user->get_object();
    $user->update( { login => '0' } ) ; 
    $c->logout();
    $c->stash->{'message'} = "Logout efectuado!";
}

sub register:Local :Args(0){



}

=head1 AUTHOR

fabiim,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
