package socialEvents::Form::UserView;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Table';


has '+item_class' => ( default => 'User' );

has_field 'usr' => ( 
    type => 'Text' , 
    required => 1 , 
    required_message => 'Introduza o nome de utilizador', 
    , readonly => 1); 

has_field 'nome'  => ( type => 'Text' , readonly =>1);
has_field 'morada' => ( type => 'Text' , readonly =>1); 
has_field 'cidade' => ( type => 'Text', readonly =>1 ); 
has_field 'codpais' => ( type => 'Select' , label => 'País' , readonly =>1 ); 
has_field 'dn' => (type => 'DateTime' , readonly =>1 ); 
has_field 'dn.year' => ( type => 'Year', readonly =>1);
has_field 'dn.month' => ( type => 'Month', readonly =>1); 
has_field 'dn.day' => ( type => 'MonthDay', readonly =>1); 
has_field 'email' => ( type   => 'Email', required => 1, required_message => 'Introduza o email.', readonly =>1);
has_field 'pwd' => (type => 'Password',  inactive => 1, noupdate => 1, readonly =>1); 
has_field 'login' => (type => 'Text', inactive =>1 , readonly =>1); 
has_field 'activo' =>(type => 'Text', inactive =>1 , readonly =>1); 

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

has '+unique_messages' =>
    ( default => sub { { users_usr =>
                             'Utilizador Existente. Por favor introduza um novo.' } } );

no HTML::FormHandler::Moose;
__PACKAGE__->meta->make_immutable;
