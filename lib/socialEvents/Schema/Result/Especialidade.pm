package socialEvents::Schema::Result::Especialidade;

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

socialEvents::Schema::Result::Especialidade

=cut

__PACKAGE__->table("especialidades");

=head1 ACCESSORS

=head2 e

  data_type: 'char'
  is_nullable: 0
  size: 4

=head2 de

  data_type: 'varchar2'
  is_nullable: 1
  size: 50

=head2 pr

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: [6,2]

=cut

__PACKAGE__->add_columns(
  "e",
  { data_type => "char", is_nullable => 0, size => 4 },
  "de",
  { data_type => "varchar2", is_nullable => 1, size => 50 },
  "pr",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => [6, 2],
  },
);
__PACKAGE__->set_primary_key("e");

=head1 RELATIONS

=head2 medicos

Type: has_many

Related object: L<socialEvents::Schema::Result::Medico>

=cut

__PACKAGE__->has_many(
  "medicos",
  "socialEvents::Schema::Result::Medico",
  { "foreign.e" => "self.e" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:euitCNhIXiPleG4fgo4Fsg


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
