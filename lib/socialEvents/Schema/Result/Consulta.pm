package socialEvents::Schema::Result::Consulta;

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

socialEvents::Schema::Result::Consulta

=cut

__PACKAGE__->table("consultas");

=head1 ACCESSORS

=head2 dh

  data_type: 'datetime'
  is_nullable: 0
  original: {data_type => "date"}

=head2 m

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 6

=head2 p

  data_type: 'nchar'
  is_foreign_key: 1
  is_nullable: 0
  size: 9

=head2 preco

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: [6,2]

=cut

__PACKAGE__->add_columns(
  "dh",
  {
    data_type   => "datetime",
    is_nullable => 0,
    original    => { data_type => "date" },
  },
  "m",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 6 },
  "p",
  { data_type => "nchar", is_foreign_key => 1, is_nullable => 0, size => 9 },
  "preco",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => [6, 2],
  },
);
__PACKAGE__->set_primary_key("dh", "m", "p");

=head1 RELATIONS

=head2 m

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Medico>

=cut

__PACKAGE__->belongs_to(
  "m",
  "socialEvents::Schema::Result::Medico",
  { m => "m" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 p

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Paciente>

=cut

__PACKAGE__->belongs_to(
  "p",
  "socialEvents::Schema::Result::Paciente",
  { p => "p" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BIA3NeVGUJ2L91WbKN4BXA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
