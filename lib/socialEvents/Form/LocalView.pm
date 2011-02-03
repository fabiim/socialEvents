package socialEvents::Form::LocalView;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';
has '+item_class' => ( default => 'Locai');

has_field 'nomel' => (type => 'Text', readonly => 1, label => 'Nome'); 
has_field 'descl' => (type => 'Text', readonly => 1, label => 'Descrição'); 
has_field 'capl' => (type => 'PosInteger', readonly => 1, label => 'Capacidade'); 
has_field 'moradal' => (type => 'Text' ,readonly => 1 , label => 'Morada'); 
has_field 'cidadel' => (type => 'Text',  readonly => 1, label => 'Cidade'); 
has_field 'codtipol' => (type => 'Select', readonly => 1, label => 'Tipo Local'); 
has_field 'codpais' => (type => 'Select', readonly => 1, label => 'País'); 
has_field 'publicol' => (type => 'Boolean', readonly => 1, label => 'Publico'); 
has_field 'criadorl' => (type => 'Text',  readonly => 1 ); 
has_field 'm18'  => (type => 'Boolean',  readonly => 1); 


#TODOLIST
#publicol
#m18

sub options_codpais{
    my $self = shift; 
    return unless $self->schema; 
    my $paises = $self->schema->resultset('Pai'); 
    my @selections; 
    while ( my $pais = $paises->next ){
        push @selections , { value => $pais->codpais , label => $pais->descpais }; 
    }
    return @selections; 
}

sub options_codtipol{
    my $self = shift; 
    return unless $self->schema; 
    my $tipos = $self->schema->resultset('Tipol'); 
    my @selections; 
    while ( my $tipo = $tipos->next ){
        push @selections , { value => $tipo->cod , label => $tipo->dsc }; 
    }
    return @selections; 
}

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;

1
