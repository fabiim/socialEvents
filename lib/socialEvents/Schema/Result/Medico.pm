package socialEvents::Schema::Result::Medico;

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

socialEvents::Schema::Result::Medico

=cut

__PACKAGE__->table("medicos");

=head1 ACCESSORS

=head2 m

  data_type: 'char'
  is_nullable: 0
  size: 6

=head2 nm

  data_type: 'varchar2'
  is_nullable: 1
  size: 100

=head2 mm

  data_type: 'varchar2'
  is_nullable: 1
  size: 100

=head2 cp

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 1
  size: 8

=head2 dnm

  data_type: 'datetime'
  is_nullable: 1
  original: {data_type => "date"}

=head2 es

  data_type: 'datetime'
  is_nullable: 1
  original: {data_type => "date"}

=head2 e

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 1
  size: 4

=cut

__PACKAGE__->add_columns(
  "m",
  { data_type => "char", is_nullable => 0, size => 6 },
  "nm",
  { data_type => "varchar2", is_nullable => 1, size => 100 },
  "mm",
  { data_type => "varchar2", is_nullable => 1, size => 100 },
  "cp",
  { data_type => "char", is_foreign_key => 1, is_nullable => 1, size => 8 },
  "dnm",
  {
    data_type   => "datetime",
    is_nullable => 1,
    original    => { data_type => "date" },
  },
  "es",
  {
    data_type   => "datetime",
    is_nullable => 1,
    original    => { data_type => "date" },
  },
  "e",
  { data_type => "char", is_foreign_key => 1, is_nullable => 1, size => 4 },
);
__PACKAGE__->set_primary_key("m");

=head1 RELATIONS

=head2 consultas

Type: has_many

Related object: L<socialEvents::Schema::Result::Consulta>

=cut

__PACKAGE__->has_many(
  "consultas",
  "socialEvents::Schema::Result::Consulta",
  { "foreign.m" => "self.m" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 cp

Type: belongs_to

Related object: L<socialEvents::Schema::Result::CodPostal>

=cut

__PACKAGE__->belongs_to(
  "cp",
  "socialEvents::Schema::Result::CodPostal",
  { cp => "cp" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);

=head2 e

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Especialidade>

=cut

__PACKAGE__->belongs_to(
  "e",
  "socialEvents::Schema::Result::Especialidade",
  { e => "e" },
  {
    is_deferrable => 1,
    join_type     => "LEFT",
    on_delete     => "CASCADE",
    on_update     => "CASCADE",
  },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:Nkr6vX/rChc8tg4R1ZQNxw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
