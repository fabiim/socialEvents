package socialEvents::Form::Search;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
has 'schema' => (isa => 'DBIx::Class::Schema' , is => 'rw'); 

#Search Events 
has_field 'input' => (type => 'Text', label => 'Search' , label => 'Procura'); 
has_field 'search_in_nome' => (type => 'Boolean',label => 'Nome',) ; 
has_field 'search_in_desc' => (type => 'Boolean',label => 'Descrição',); 
has_field 'tipo_de_evento' => (type => 'Multiple', label => 'Tipo de Evento',  default => 'Todos' ); 
has_field 'tipo_de_local' => (type => 'Multiple' , default => 'Todos', label => 'Tipo do local'); 
has_field 'preco_min'      => (type => 'Money', label => 'Preço Mínimo'); 
has_field 'preco_max'      => (type => 'Money', label => 'Preço Máximo'); 
has_field 'maior_que_18' =>  (type => 'Boolean', label => 'M18'); 
has_field 'depois_de' =>  (type => 'DateTime', label => 'Acontece depois de:'); 
has_field 'depois_de.year' => ( type => 'Year', label => 'Ano');
has_field 'depois_de.month' => ( type => 'Month', label => 'Mês'); 
has_field 'depois_de.day' => ( type => 'MonthDay', label => 'Dia'); 
has_field 'depois_de_bool' => (type => 'Boolean', label => 'Escolha para Depois de ter efeito'); 
has_field 'maluk' => (type => 'Text', ishidden  => 1, inactive => 1);
has_field 'antes_de' =>  (type => 'DateTime', label => 'Acontece antes de:'); 
has_field 'antes_de.year' => ( type => 'Year', label => 'Ano');
has_field 'antes_de.month' => ( type => 'Month', label => 'Mês'); 
has_field 'antes_de.day' => ( type => 'MonthDay', label => 'Dia'); 
has_field 'antes_de_bool' => (type => 'Boolean', label => 'Escolha para Antes de ter efeito'); 
has_field 'order_by' => ( type => 'Select' , label => 'Ordenar por'); 

has_field 'submit' => (type => 'Submit' , value => 'Go!'); 
sub options_order_by{
    return( 
        0 => 'Qualquer' , 
        1 => 'Data', 
	2 => 'Preço', 
        ); 
}

sub options_tipo_de_local{
    my $self = shift; 
    return unless $self->schema; 
    my $tipos = $self->schema->resultset('Tipol'); 
    my @selections; 
    push @selections , { value => 'Todos' , label => 'Todos' };  
    while ( my $tipo = $tipos->next ){
        push @selections , { value => $tipo->cod , label => $tipo->dsc }; 
    }
    return @selections; 
}

sub options_tipo_de_evento{
    my $self = shift; 
    return unless $self->schema; 
    my $tipos = $self->schema->resultset('Tipoe'); 
    my @selections; 
    push @selections , { value => 'Todos' , label => 'Todos' };  
    while ( my $tipo = $tipos->next ){
        push @selections , { value => $tipo->cod , label => $tipo->dsc }; 
    }
    return @selections; 
}

#todo - Por defeito devia ter qualquer no select do tipo de evento. 
#has_field 'locais' => (type => 'Select'); 
#has_field 'tipoLocal' => (type => 'Select');


#Todo - must have at least one field selected : nome or descriçao
1; 
