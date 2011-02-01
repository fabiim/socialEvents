package socialEvents::Form::Register;

use HTML::FormHandler::Moose;
extends 'HTML::FormHandler::Model::DBIC';
with 'HTML::FormHandler::Render::Simple';

has '+item_class' => ( default => 'User' );
has_field 'usr' => ( 
    type => 'Text' , 
    required => 1 , 
    required_message => 'Introduza o nome de utilizador', 
    minlength => 4 , ); 

has_field 'nome'  => ( type => 'Text' , label => 'Nome', required =>1, required_message => 'Obrigatório',);
has_field 'morada' => ( type => 'Text', label => 'Morada', required =>1, required_message => 'Obrigatório',) ; 
has_field 'cidade' => ( type => 'Text', label => 'Cidade', required =>1, required_message => 'Obrigatório',); 
has_field 'codpais' => ( type => 'Select' , label => 'País',  ); 
has_field 'sexo'   => ( type => 'Select' , label => 'Sexo', );
has_field 'dn' => (type => 'DateTime' , label => 'Data de Nascimento'); 
has_field 'dn.year' => ( type => 'Year', label => 'Ano', range_start => 1900 , range_end => 3000);
has_field 'dn.month' => ( type => 'Month', label => 'Mês'); 
has_field 'dn.day' => ( type => 'MonthDay', label => 'Dia'); 
has_field 'email' => ( type   => 'Email', label => 'Email',  required => 1, required_message => 'Introduza o email.', unique => 1, unique_message => 'Email existente.'  ,);
has_field 'pwd' => (type => 'Password', label => 'Password', required => 1, required_message => 'Obrigatório', minlength => 4); 
has_field 'pwd_confirm' => (type => 'PasswordConf', password_field => 'pwd' , label => 'ConfPwd', required => 1 , required_message => 'Obrigatório'); 

has_field 'submit' => ( type => 'Submit', value => 'Registar' );

sub options_sexo{
    return( 
        1 => 'Masculino' , 
        0 => 'Feminino' , 
        ); 
}
sub validate{
    my $self = shift; 
    return unless $self->schema; 
    my $usr = $self->schema->resultset('User')->find({ usr => $self->value->{usr} }) ; 
    if ($usr) {
        $self->field('usr')->add_error('Utilizador existente'); 
    }

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
1
