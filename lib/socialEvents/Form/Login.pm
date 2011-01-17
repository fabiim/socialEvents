package socialEvents::Form::Login;
use HTML::FormHandler::Moose;
extends 'HTML::FormHandler';

has_field 'user' => ( label => 'Utilizador', required => 1 , required_message => 'Por favor Introduza o utilizador');
has_field 'password' => ( type => 'Password', required => 1 , required_message => 'Por favor introduza a sua password');
has_field 'submit' => ( type => 'Submit', value => 'Login' );

1;
