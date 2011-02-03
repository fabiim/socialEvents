package socialEvents::Form::EventoEdit;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';

has '+item_class' => ( default => 'Evento' );
has 'criador_evento' => ( isa => 'Str', is => 'rw' );
has 'id_local' => ( isa => 'Str' , is => 'rw'); 

has_field 'idevento' => ( type => 'PrimaryKey' , inactive =>1, noupdate => 1 ); 
has_field 'nomee' => ( type => 'Text' , required => 1 , required_message => 'Obrigatório', label => 'Nome'); 
has_field 'precoe' => (type => 'Money' ,label => 'Preço' , required => 1);
has_field 'cape' => (type => 'PosInteger', label => 'Capacidade', minlength =>  1, maxlength => 8 ); 
has_field 'publico' => (type => 'Boolean', label => 'Publico'); 
has_field 'duracao' => (type => 'PosInteger', maxlength => 100, label => 'Duração Horas', required => 1 ); 
has_field 'datai' => (type => 'DateTime', label => 'Data de Evento'); 
has_field 'datai.year' => ( type => 'Year', label => 'Ano');
has_field 'datai.month' => ( type => 'Month', label => 'Mês'); 
has_field 'datai.day' => ( type => 'MonthDay', label => 'Dia'); 
has_field 'datai.hour' => ( type => 'Hour', label => 'Hora'); 
has_field 'datai.minute' => (type => 'Minute', label => 'Minutos'); 
has_field 'codtipoe' => ( type => 'Select', required => 1, label => 'Tipo Evento'); 
has_field 'desce' => ( type =>'Text' , required => 1, required_message => 'Obrigatório', label => 'Descrição', minlength => 3 , maxlength => 10000); 
has_field 'criadore' => (type =>'Text', inactive =>1); 
has_field 'm18' => (type => 'Boolean', ); 
has_field 'idlocal' => (type => 'Text', inactive =>1, ); 
has_field 'submit' => ( type => 'Submit', value => 'Submeter' );

before 'update_model' => sub {
    my $self = shift;
    $self->item->criadore( $self->criador_evento );
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



