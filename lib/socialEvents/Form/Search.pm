package socialEvents::Form::Search;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';
has 'schema' => (isa => 'DBIx::Class::Schema' , is => 'rw'); 

#Search Events 
has_field 'input' => (type => 'Text', required => 1 , ); 
has_field 'search_in_nome' => (type => 'Boolean') ; 
has_field 'search_in_desc' => (type => 'Boolean'); 
has_field 'tipo_de_evento' => (type => 'Multiple',   default => 'Todos' ); 
has_field 'preco_min'      => (type => 'Text'); 
has_field 'preco_max'      => (type => 'Text'); 
has_field 'maior_que_18' =>  (type => 'Boolean'); 
has_field 'depois_de' =>  (type => 'DateTime'); 
has_field 'depois_de.year' => ( type => 'Year');
has_field 'depois_de.month' => ( type => 'Month'); 
has_field 'depois_de.day' => ( type => 'MonthDay'); 
has_field 'depois_de_bool' => (type => 'Boolean'); 

has_field 'antes_de' =>  (type => 'DateTime'); 
has_field 'antes_de.year' => ( type => 'Year');
has_field 'antes_de.month' => ( type => 'Month'); 
has_field 'antes_de.day' => ( type => 'MonthDay'); 
has_field 'antes_de_bool' => (type => 'Boolean'); 

has_field 'tipo_de_local' => (type => 'Multiple' , default => 'Todos'); 

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
has_field 'submit' => (type => 'Submit' , label => 'Go!'); 

#Todo - must have at least one field selected : nome or descriçao
1; 
