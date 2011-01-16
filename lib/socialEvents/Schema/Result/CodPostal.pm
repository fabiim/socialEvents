package socialEvents::Schema::Result::CodPostal;

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

socialEvents::Schema::Result::CodPostal

=cut

__PACKAGE__->table("cod_postal");

=head1 ACCESSORS

=head2 cp

  data_type: 'char'
  is_nullable: 0
  size: 8

=head2 l

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=cut

__PACKAGE__->add_columns(
  "cp",
  { data_type => "char", is_nullable => 0, size => 8 },
  "l",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
);
__PACKAGE__->set_primary_key("cp");

=head1 RELATIONS

=head2 medicos

Type: has_many

Related object: L<socialEvents::Schema::Result::Medico>

=cut

__PACKAGE__->has_many(
  "medicos",
  "socialEvents::Schema::Result::Medico",
  { "foreign.cp" => "self.cp" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 pacientes

Type: has_many

Related object: L<socialEvents::Schema::Result::Paciente>

=cut

__PACKAGE__->has_many(
  "pacientes",
  "socialEvents::Schema::Result::Paciente",
  { "foreign.cp" => "self.cp" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:JBL2+PPc+/gGBYsReAiSCw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
