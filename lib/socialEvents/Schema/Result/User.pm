package socialEvents::Schema::Result::User;

# Created by DBIx::Class::Schema::Loader
# DO NOT MODIFY THE FIRST PART OF THIS FILE

use strict;
use warnings;

use Moose;
use MooseX::NonMoose;
use namespace::autoclean;
extends 'DBIx::Class::Core';

__PACKAGE__->load_components("InflateColumn::DateTime");

=head1 NAME

socialEvents::Schema::Result::User

=cut

__PACKAGE__->table("users");

=head1 ACCESSORS

=head2 usr

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 nome

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 morada

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 cidade

  data_type: 'varchar2'
  is_nullable: 0
  size: 30

=head2 codpais

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 3

=head2 dn

  is_auto_increment: 1

=head2 pwd

  data_type: 'varchar2'
  is_nullable: 0
  size: 50

=head2 activo

  data_type: 'char'
  default_value: 1
  is_nullable: 0
  size: 1

=head2 login

  data_type: 'char'
  default_value: 0
  is_nullable: 0
  size: 1

=head2 email

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 sexo

  data_type: 'char'
  default_value: 1
  is_nullable: 0
  size: 1

=cut

__PACKAGE__->add_columns(
  "usr",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "nome",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "morada",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "cidade",
  { data_type => "varchar2", is_nullable => 0, size => 30 },
  "codpais",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 3 },
  "dn",
  { is_auto_increment => 1 },
  "pwd",
  { data_type => "varchar2", is_nullable => 0, size => 50 },
  "activo",
  { data_type => "char", default_value => 1, is_nullable => 0, size => 1 },
  "login",
  { data_type => "char", default_value => 0, is_nullable => 0, size => 1 },
  "email",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "sexo",
  { data_type => "char", default_value => 1, is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("usr");

=head1 RELATIONS

=head2 amigos_amigoes

Type: has_many

Related object: L<socialEvents::Schema::Result::Amigo>

=cut

__PACKAGE__->has_many(
  "amigos_amigoes",
  "socialEvents::Schema::Result::Amigo",
  { "foreign.amigo" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 amigos_usrs

Type: has_many

Related object: L<socialEvents::Schema::Result::Amigo>

=cut

__PACKAGE__->has_many(
  "amigos_usrs",
  "socialEvents::Schema::Result::Amigo",
  { "foreign.usr" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 convrej_amigoes

Type: has_many

Related object: L<socialEvents::Schema::Result::Convrej>

=cut

__PACKAGE__->has_many(
  "convrej_amigoes",
  "socialEvents::Schema::Result::Convrej",
  { "foreign.amigo" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 convrej_usrs

Type: has_many

Related object: L<socialEvents::Schema::Result::Convrej>

=cut

__PACKAGE__->has_many(
  "convrej_usrs",
  "socialEvents::Schema::Result::Convrej",
  { "foreign.usr" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 eventoes

Type: has_many

Related object: L<socialEvents::Schema::Result::Evento>

=cut

__PACKAGE__->has_many(
  "eventoes",
  "socialEvents::Schema::Result::Evento",
  { "foreign.criadore" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 e_fois

Type: has_many

Related object: L<socialEvents::Schema::Result::EFoi>

=cut

__PACKAGE__->has_many(
  "e_fois",
  "socialEvents::Schema::Result::EFoi",
  { "foreign.usr" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 e_inscritoes

Type: has_many

Related object: L<socialEvents::Schema::Result::EInscrito>

=cut

__PACKAGE__->has_many(
  "e_inscritoes",
  "socialEvents::Schema::Result::EInscrito",
  { "foreign.usr" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 locais

Type: has_many

Related object: L<socialEvents::Schema::Result::Locai>

=cut

__PACKAGE__->has_many(
  "locais",
  "socialEvents::Schema::Result::Locai",
  { "foreign.criadorl" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 tipospref

Type: might_have

Related object: L<socialEvents::Schema::Result::Tipospref>

=cut

__PACKAGE__->might_have(
  "tipospref",
  "socialEvents::Schema::Result::Tipospref",
  { "foreign.usr" => "self.usr" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 codpai

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Pai>

=cut

__PACKAGE__->belongs_to(
  "codpai",
  "socialEvents::Schema::Result::Pai",
  { codpais => "codpais" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-02-02 05:48:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:/AdYJZ9eAGefOnn1ZGwymw

__PACKAGE__->remove_column('dn'); 
__PACKAGE__->add_column('dn' => {
    data_type   => "datetime",
    is_nullable => 0,
    original    => { data_type => "date" },
			});

# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
