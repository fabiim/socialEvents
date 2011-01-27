package socialEvents::Form::EventoEdit;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';


has '+item_class' => ( default => 'Evento' );
has 'criador_evento' => ( isa => 'Str', is => 'rw' );
has 'id_local' => ( isa => 'Int' , is => 'rw'); 

has_field 'idevento' => ( type => 'PrimaryKey' , inactive =>1, noupdate => 1 ); 
has_field 'nomee' => ( type => 'Text' , required => 1); 
has_field 'cape' => (type => 'PosInteger'); 
has_field 'precoe' => (type => 'PosInteger' );
has_field 'publico' => (type => 'Boolean'); 
has_field 'duracao' => (type => 'PosInteger', required =>1); 
has_field 'datai' => (type => 'DateTime'); 
has_field 'datai.year' => ( type => 'Year');
has_field 'datai.month' => ( type => 'Month'); 
has_field 'datai.day' => ( type => 'MonthDay'); 
has_field 'datai.hour' => ( type => 'Hour'); 
has_field 'datai.minute' => (type => 'Minute'); 
has_field 'codtipoe' => ( type => 'Select', required => 1); 
has_field 'desce' => ( type =>'Text' , label => 'Descrição Evento'); 
has_field 'criadore' => (type =>'Text', inactive =>1); 
has_field 'm18' => (type => 'Boolean'); 
has_field 'idlocal' => (type => 'PosInteger', inactive =>1); 
has_field 'submit' => ( type => 'Submit', value => 'Adicionar' );


before 'update_model' => sub {
    my $self = shift;
    $self->item->criadore($self->criador_evento);
    $self->item->idlocal( $self->id_local); 
};

sub options_codtipoe{
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



