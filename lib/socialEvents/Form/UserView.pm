package socialEvents::Form::UserView;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';


has '+item_class' => ( default => 'User' );

has_field 'usr' => ( 
    type => 'Text' , 
    , readonly => 1,
    label =>'Username'
); 
has_field 'nome'  => ( type => 'Text' , readonly =>1, label => 'Nome');
has_field 'morada' => ( type => 'Text' , readonly =>1 , label => 'Morada'); 
has_field 'cidade' => ( type => 'Text', readonly =>1 , label => 'Cidade'); 
has_field 'codpais' => ( type => 'Select' , label => 'País' , readonly =>1 , label => 'País'); 
has_field 'dn' => (type => 'DateTime' , readonly =>1 , label =>'Data de Nascimento'); 
has_field 'dn.year' => ( type => 'Year', readonly =>1, label => 'Ano');
has_field 'dn.month' => ( type => 'Month', readonly =>1, label => 'Mês'); 
has_field 'dn.day' => ( type => 'MonthDay', readonly =>1, label => 'Dia'); 
has_field 'email' => ( type   => 'Email', , readonly =>1, label => 'Email');
has_field 'login' => (type => 'Text', inactive =>1 , readonly =>1, 'Online'); 

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

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
