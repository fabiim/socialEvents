package socialEvents::Controller::Amigos;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }
sub checkUser:Private {
    my ($self , $c ) = @_ ;
    if (!$c->user_exists()){
        $c->response->redirect( $c->uri_for('/user/login')); 
        $c->detach(); 
    }
 }   


sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->user_exists($c);
    $c->stash( template => 'amigos/index.tt' ); 
    $self->do_list($c); 
}

sub do_list
{
   my ($self, $c ) = @_;
   my $eu = $c->model('DB::User')->find({ usr => $c->user->get('usr')}, { key => 'primary' }); 
   my @amigos = $c->model('DB::Amigo')->search({ usr => $c->user->get('usr')})->all();  
   if (@amigos > 0 ){
       $c->stash(amigos  => \@amigos ); 
   }
}

sub add: Local :Args(1){
    my ($self , $c, $id_amigo) = @_; 
    $self->checkUser($c);

    my $amigo = $c->model('DB::User')->find($id_amigo); 
    if (!$amigo){
	$c->response->redirect( $c->uri_for('/amigos')); 
    }
    
    $amigo = $c->model('DB::Amigo')->find_or_create({ usr => $c->user->get('usr'), amigo => $id_amigo}); 
    $amigo = $c->model('DB::Amigo')->find_or_create({ usr => $id_amigo, amigo =>   $c->user->get('usr')}); 
    $c->stash->{message} = "Amizade  com " . $id_amigo . " criada!"; 
    $c->response->redirect($c->uri_for('/amigos')); 
}

__PACKAGE__->meta->make_immutable;

1;
