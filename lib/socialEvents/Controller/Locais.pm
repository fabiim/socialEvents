package socialEvents::Controller::Locais;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use socialEvents::Form::LocalEdit;
has 'edit_form' => ( isa => 'socialEvents::Form::LocalEdit' , is => 'rw' , lazy => 1 , default => sub { socialEvents::Form::LocalEdit->new }) ; 

=head1 NAME

socialEvents::Controller::Locais - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 index

=cut

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( template => 'local/index.tt' ); 
    $self->do_list($c) ; 
}

sub do_list
{
   my ( $self, $c ) = @_;
   my $locais_criados = [ $c->model('DB::Locai')->search({ criadorl => $c->user->get('usr') })];
   $c->stash(locais_criados => $locais_criados, template => 'local/list.tt' );
}

sub create: Local: Args(0){
    my ($self , $c ) = @_; 
    $c->stash( template => 'local/edit.tt' , 
               form => $self->edit_form ) ; 

    my $new_local = $c->model('DB::Locai')->new_result({}); 

    $self->edit_form->process( 
        item => $new_local, 
        params => $c->request->parameters, 
        schema => $c->model('DB')->schema,
        criador_local => $c->user->get('usr')
        );

    return if !$self->edit_form->is_valid; 

    $c->flash->{message} = 'Local Criado'; 
    $c->response->redirect( $c->uri_for('/locais/index')); 
}

=head1 AUTHOR

fabiim,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
