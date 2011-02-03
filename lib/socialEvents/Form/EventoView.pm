package socialEvents::Form::EventoView;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';


has '+item_class' => ( default => 'Evento' );

has_field 'nomee' =>( type => 'Text' , readonly => 1); 
has_field 'cape' => (type => 'PosInteger',readonly => 1); 
has_field 'precoe' => (type => 'PosInteger' , readonly => 1);
has_field 'publico' => (type => 'Boolean', readonly => 1); 
has_field 'duracao' => (type => 'PosInteger', readonly => 1); 
has_field 'datai' => (type => 'DateTime', readonly => 1); 
has_field 'datai.year' => ( type => 'Year', readonly => 1);
has_field 'datai.month' => ( type => 'Month', readonly => 1); 
has_field 'datai.day' => ( type => 'MonthDay', readonly => 1); 
has_field 'datai.hour' => ( type => 'Hour', readonly => 1); 
has_field 'datai.minute' => (type => 'Minute', readonly => 1); 
has_field 'codtipoe' => ( type => 'Select', readonly => 1); 
has_field 'desce' => ( type =>'Text' , label => 'Descrição Evento', readonly => 1); 
has_field 'criadore' => (type =>'Text', readonly => 1); 
has_field 'm18' => (type => 'Boolean', readonly => 1); 
has_field 'idlocal' => (type => 'PrimaryKey', readonly => 1); 


sub options_codtipe{
    my $self = shift; 
    return unless $self->schema; 
    my $tipos = $self->schema->resultset('Tipoe'); 
    my @selections; 
    while ( my $tipo = $tipos->next ){
        push @selections , { value => $tipo->cod , label => $tipo->dsc }; 
    }
    return @selections; 
}

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
1



