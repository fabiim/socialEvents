package socialEvents::Controller::Search;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

use socialEvents::Form::Search;

has 'search_form' => ( isa => 'socialEvents::Form::Search' , is => 'rw' , lazy => 1 , default => sub { socialEvents::Form::Search->new }) ; 

sub search : Global {
    my ($self , $c ) = @_; 
    $c->stash( template => 'search/form.tt',
               form => $self->search_form); 

    $self->search_form->process(params => $c->req->params, schema => $c->model('DB')->schema); 
    
    return unless $self->search_form->is_valid; 
    
    my $input = $self->search_form->field('input')->value;
    $input = '%' . $input . '%'; 



    my $rs = $c->model('DB::Evento');

#search nome ou descriçao
    my @options; 

    my $inName = $self->search_form->field('search_in_nome')->value; 
    my $inDesc = $self->search_form->field('search_in_desc')->value; 

    if ($inName){
        my $hash_ref = {}; 
        $hash_ref->{'nomee' } = { -like => $input } ; 
        push (@options  , $hash_ref); 
    }
    if ($inDesc){
        my $hash_ref = {}; 
        $hash_ref->{'desce' } = { -like => $input } ; 
        push (@options  , $hash_ref); 
    }

    if ($inName || $inDesc){
        $rs =   $rs->search({ -or => \@options}); 
    }

#Search tipo de evento
    if (my @array = $self->search_form->field('tipo_de_evento')->value){
        if (grep {$_ ne 'Todos'} @array){
            $c->log->debug("O PRA MIM AQUI!" . @array); 
            $rs = $rs->search({ codtipoe => { '=' =>   \@array }}); 
        }
    }
    $rs = $rs->search({}, { '+columns' => ['codtipoe.dsc'] , join => ['codtipoe'] }); 

#Search tipo de local 
    if (my @array = $self->search_form->field('tipo_de_local')->value){
        if (grep {$_ ne 'Todos'} @array){
            $c->log->debug("O PRA MIM AQUI!" . @array);
#            my $sql = 'IS NOT NULL';
            $rs = $rs->search( { 'me.idlocal' =>{'!=' => undef}});
#            $rs = $rs->search({idlocal => { '!=' => undef }}; 
             $rs = $rs->search({ 'idlocal.codtipol' => { '=' =>   \@array }}, { join => 'idlocal', }); 
        }
    }
    
#Search preço minimo e máximo. 

    if (my $preco_min = $self->search_form->field('preco_min')->value){
        $rs = $rs->search( { precoe => { '>=' => \$preco_min} }); 
    }
    if (my $preco_max = $self->search_form->field('preco_max')->value){
        $rs = $rs->search( { precoe => { '<=' => \$preco_max} }); 
    }

#Search maiores que 18 
    if (my $preco_max = $self->search_form->field('maior_que_18')->value){
        $rs = $rs->search( { m18 => '1'   }); 
    }

#Search dates . Precisamos de um datetime parser para o nosso dbd
my $dtf = $c->model('DB')->schema->storage->datetime_parser;

#search date between  2 dates
    my $do_after =  $self->search_form->field('depois_de_bool')->value; 
    my $do_before = $self->search_form->field('antes_de_bool')->value ; 

    if ($do_after && $do_before){
        my $date_start = $self->search_form->field('depois_de')->value; 
        my $date_end =  $self->search_form->field('antes_de')->value; 
        $rs = $rs->search( { datai => { -between => 
                                            [  $dtf->format_datetime($date_start),
                                               $dtf->format_datetime($date_end), 
                                            ],
                             }
                           }); 
    }

    else{
#Search date depois_de 
        if ($do_after){
            my $date_start = $self->search_form->field('depois_de')->value; 
            $rs = $rs->search( { datai => { '>=' => $dtf->format_datetime($date_start)}});    
        }  
#search date antes_de
        if ($do_before){
            my $date_end = $self->search_form->field('antes_de')->value; 
            $rs = $rs->search( { datai => { '<=' => $dtf->format_datetime($date_end)}});    
        }
    }

    
    $c->stash->{results} = $rs; 
    $c->stash->{'template'} =  'search/debug.tt';         

#search date antes_de 




}



__PACKAGE__->meta->make_immutable;
1;
