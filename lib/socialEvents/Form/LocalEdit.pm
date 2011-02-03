package socialEvents::Form::LocalEdit;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';

has '+item_class' => ( default => 'Locai');
has 'criador_local' => ( isa => 'Str', is => 'rw' );

has_field 'idlocal' => (type => 'PrimaryKey', inactive => 1 , noupdate => 1); 
has_field 'nomel' => (type => 'Text', label => 'Nome',required => 1,  required_message => 'Obrigatório', maxlength => 100); 
has_field 'descl' => (type => 'Text', label => 'Descrição' ,required => 1, required_message => 'Obrigatório', maxlength => 100); 
has_field 'capl' => (type => 'PosInteger', label => 'Capacidade'); 
has_field 'moradal' => (type => 'Text' , label => 'Morada', required => 1, required_message => 'Obrigatório', maxlength => 100); 
has_field 'cidadel' => (type => 'Text', label => 'Cidade' , required => 1, required_message => 'Obrigatório', maxlength => 30); 
has_field 'codtipol' => (type => 'Select', label => 'Tipo Local', required =>1); 
has_field 'codpais' => (type => 'Select', label => 'País',  required => 1); 
has_field 'publicol' => (type => 'Boolean', label => 'Publico' ); 
has_field 'criadorl' => (type => 'Text', inactive => 1); 
has_field 'm18'  => (type => 'Boolean', label => '>18'); 
has_field 'submit' => ( type => 'Submit', value => 'Salvar');

before 'update_model' => sub {
    my $self = shift;
    $self->item->criadorl( $self->criador_local );
};

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
