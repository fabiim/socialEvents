package socialEvents::Controller::Eventos;
use Moose;
use namespace::autoclean;
use DateTime; 
BEGIN {extends 'Catalyst::Controller'; }

use socialEvents::Form::EventoEdit;
use socialEvents::Form::EventoView;

has 'edit_form' => ( isa => 'socialEvents::Form::EventoEdit' , is => 'rw' , lazy => 1 , default => sub { socialEvents::Form::EventoEdit->new }) ; 

has 'view_form' => ( isa => 'socialEvents::Form::EventoView' , is => 'rw' , lazy => 1 , default => sub { socialEvents::Form::EventoView->new }) ; 

sub checkUser:Private {
    my ($self , $c ) = @_ ;
    if (!$c->user_exists()){
        $c->response->redirect( $c->uri_for('/user/login')); 
        $c->detach(); 
    }
 }   

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $self->checkUser($c); 
    $c->stash( template => 'evento/index.tt' ); 
    $self->do_list($c); 
}

sub add_going : Local : Args(1){
    my ($self , $c, $id_evento) = @_; 
    $self->checkUser($c); 
    my $evento = $c->model('DB::Evento')->find($id_evento); 
    if (!$evento) {

    }
    
    my $dataHoje= DateTime->from_epoch(epoch => time()); 
    my $cmp = DateTime->compare($dataHoje , $evento->datai);
    if ($cmp <= 0 ){
	$evento->e_inscritoes->find_or_create({ idevento => $id_evento , usr => $c->user->get('usr')},{ key => 'primary' } );   
    }
    $c->response->redirect( $c->uri_for('/eventos/view', $evento->idevento)); 
}

sub add_foi : Local : Args(1){
    my ($self , $c, $id_evento) = @_; 
    $self->checkUser($c); 
    my $evento = $c->model('DB::Evento')->find($id_evento); 

    
    if (!$evento) {
        die "No such evento";
    }

    my $dataHoje= DateTime->from_epoch(epoch => time()); 
    my $cmp = DateTime->compare($dataHoje , $evento->datai);
    if ($cmp >= 0 ) { 
    $evento->e_fois->find_or_create({ idevento => $id_evento , usr => $c->user->get('usr')},{ key => 'primary' } );   
    }
    else {die "Ainda nao começou"; }

    $c->response->redirect( $c->uri_for('/eventos/view', $evento->idevento)); 
}

sub view : Local : Args(1){
    my ($self , $c, $id_evento) = @_; 
    $self->checkUser($c); 
    #check to see if this event exists 
    

    
    my $evento = $c->model('DB::Evento')->find($id_evento );  # returns just one or undef
    if (!$evento){
        $c->stash(error => 'Evento inexistente' ); 
        $c->response->redirect( $c->uri_for('index')); 
        $c->detach();
    }

    my $dataHoje= DateTime->from_epoch(epoch => time()); 
    my $cmp = DateTime->compare($dataHoje , $evento->datai);
    my $podeir = 0 ;
    if ($cmp <= 0 ){   $podeir = 1; }
    my $search_foi = $c->model('DB::Efoi')->find( { usr => $c->user->get('usr'), idevento => $evento->idevento}); 
    my $search_vai = $c->model('DB::EInscrito')->find( { usr => $c->user->get('usr'), idevento => $evento->idevento}); 

    my $usr = $c->user->get('usr'); 
    my $criador= $evento->criadore->usr; 
    #check to see if we are the owner 
    if ($usr eq $criador){
        $c->stash(form => $self->edit_form, 
                  template => 'evento/edit.tt'); 
        $self->edit_form->process( 
        item => $evento, 
        params => $c->request->parameters, 
        schema => $c->model('DB')->schema,
        criador_evento => $c->user->get('usr'),
	    id_local => $evento->idlocal->idlocal,
        );


        return if !$self->edit_form->is_valid; 

        $c->flash->{message} = 'Alterações efectuadas'; 
        $c->response->redirect( $c->uri_for('index')); 
        $c->detach();
#edita o local
    }
    else{
        $c->stash( template => 'evento/view.tt',
                   form => $self->view_form,
		   podeir => $podeir , 
		   evento => $evento,
		   foi => $search_foi, 
		   vai => $search_vai,
	    ); 
        $self->view_form->process( 
            item => $evento, 
            params => $c->request->parameters, 
            schema => $c->model('DB')->schema,
        );
        return if !$self->edit_form->is_valid; 
        
    }

    
} 

sub do_list
{
   my ($self, $c ) = @_;

   my $eventos_criados =  [$c->model('DB::Evento')->search({ criadore => $c->user->get('usr') })->all()];
   my @colref = ('nomee', 'cape', 'tipoe', 'm18'); 
   my @colnames = ('Nome' , 'Capacidade' , 'Tipo' , 'Maior que 18');
   $c->stash(eventos_criados => $eventos_criados , colref => \@colref, colnames => \@colnames );
}

sub create: Local: Args(1){
    my ($self , $c ,$id_local) = @_;
    $self->checkUser($c); 
    my $local = $c->model('DB::Locai')->find($id_local); 
    if (!$local){
        $c->stash(error => 'Localize um Local onde criar o seu evento.' ); 
        $c->response->redirect( $c->uri_for('/locais/')); 
        $c->detach();
    }
    
    $c->stash( template => 'evento/edit.tt' , 
               form => $self->edit_form); 
    
    my $new_evento = $c->model('DB::Evento')->new_result({}); 
    

    $self->edit_form->process( 
        item => $new_evento, 
        params => $c->request->parameters, 
        schema => $c->model('DB')->schema,
        criador_evento => $c->user->get('usr'),
        id_local => $id_local  
        );

    return if !$self->edit_form->is_valid; 

    $c->flash->{message} = 'Evento Criado'; 
    $c->response->redirect( $c->uri_for('index')); 
}

__PACKAGE__->meta->make_immutable;

1;
