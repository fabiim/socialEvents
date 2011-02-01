package socialEvents::Controller::Amigos;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->stash( template => 'amigos/index.tt' ); 
    $self->do_list($c); 
}

sub do_list
{
   my ($self, $c ) = @_;
   my $eu = $c->model('DB::User')->find({ usr => $c->user->get('usr')}, { key => 'primary' }); 
   my $amigos = $c->model('DB::Amigo')->search({ usr => $c->user->get('usr')});  
   $c->stash(amigos  => $amigos ); 
}

sub add: Local :Args(1){
    my ($self , $c, $id_amigo) = @_; 
    my $amigo = $c->model('DB::User')->find($id_amigo); 

    
#    if (!$amigo) {
#        die "No such evento";
#    }
#    $evento->e_inscritoes->find_or_create({ idevento => $id_evento , usr => $c->user->get('usr')},{ key => 'primary' } );   
#    my $e_insc_rs = $c->model('DB::EInscrito'); 

}

__PACKAGE__->meta->make_immutable;

1;
