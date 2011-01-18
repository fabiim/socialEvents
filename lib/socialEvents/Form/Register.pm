package socialEvents::Form::Register;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';



has '+item_class' => ( default => 'User' );

has_field 'usr' => ( type => 'Text' , required => 1 , required_message => 'Introduza o nome de utilizador' );
has_field 'nome'  => ( type => 'Text' );
has_field 'morada' => ( type => 'Text'); 
has_field 'cidade' => ( type => 'Text'); 
has_field 'codpais' => ( type => 'Select' , label => 'País' ); 
has_field 'dn' => (type => 'DateTime' ); 
has_field 'dn.year' => ( type => 'Year');
has_field 'dn.month' => ( type => 'Month'); 
has_field 'dn.day' => ( type => 'MonthDay'); 
has_field 'pwd' => (type => 'Password'); 
has_field 'pwd_confirm' => (type => 'PasswordConf', password_field => 'pwd' ); 

has_field 'email' => ( type   => 'Email', required => 1, required_message => 'Introduza o email.');

has_field 'submit' => ( type => 'Submit', value => 'Register' );

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

1
