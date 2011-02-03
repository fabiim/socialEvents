package socialEvents::Form::Perfil;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

has '+item_class' => ( default => 'User' );

has_field 'usr' => ( 
    type => 'Text' , 
    readonly  => 1,
    ); 

has_field 'nome'  => ( type => 'Text' , label => 'Nome', required =>1, required_message => 'Obrigatório',);
has_field 'morada' => ( type => 'Text', label => 'Morada', required =>1, required_message => 'Obrigatório',) ; 
has_field 'cidade' => ( type => 'Text', label => 'Cidade', required =>1, required_message => 'Obrigatório',); 
has_field 'codpais' => ( type => 'Select' , label => 'País',  ); 
has_field 'dn' => (type => 'DateTime' ); 
has_field 'dn.year' => ( type => 'Year');
has_field 'dn.month' => ( type => 'Month');
has_field 'dn.day' => ( type => 'MonthDay'); 
has_field 'sexo'   => ( type => 'Select' , label => 'Sexo', );
has_field 'email' => ( type   => 'Email', label => 'Email',  required => 1, required_message => 'Introduza o email.', unique => 1, unique_message => 'Email existente.'  ,);
has_field 'pwd' => (type => 'Password', label => 'Pass Nova', minlength => 4); 
has_field 'pwd_confirm' => (type => 'PasswordConf', password_field => 'pwd' , label => 'Confirm', required => 0); 


has_field 'submit' => ( type => 'Submit', value => 'Salvar Alterações' );

sub options_sexo{
    return( 
        1 => 'Masculino' , 
        0 => 'Feminino' , 
        ); 
}

sub validate{
    my $self = shift; 
    return unless ($self->field('pwd')->value);
    $self->field('pwd_confirm')->add_error('Passwords diferentes') if ($self->field('pwd_confirm')->value ne  $self->field('pwd')->value);
}

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
