package socialEvents::Schema::Result::Locai;

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

socialEvents::Schema::Result::Locai

=cut

__PACKAGE__->table("locais");

=head1 ACCESSORS

=head2 idlocal

  is_auto_increment: 1
  is_nullable: 0
  sequence: 'idlocal'

=head2 nomel

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 descl

  data_type: 'varchar2'
  is_nullable: 0
  size: 1000

=head2 capl

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: 126

=head2 moradal

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 cidadel

  data_type: 'varchar2'
  is_nullable: 0
  size: 30

=head2 codtipol

  data_type: 'numeric'
  is_foreign_key: 1
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 codpais

  data_type: 'char'
  is_foreign_key: 1
  is_nullable: 0
  size: 3

=head2 publicol

  data_type: 'char'
  is_nullable: 0
  size: 1

=head2 criadorl

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 0
  size: 100

=head2 m18

  data_type: 'char'
  is_nullable: 0
  size: 1

=cut

__PACKAGE__->add_columns(
  "idlocal",
  { is_auto_increment => 1, is_nullable => 0, sequence => "idlocal" },
  "nomel",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "descl",
  { data_type => "varchar2", is_nullable => 0, size => 1000 },
  "capl",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => 126,
  },
  "moradal",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "cidadel",
  { data_type => "varchar2", is_nullable => 0, size => 30 },
  "codtipol",
  {
    data_type => "numeric",
    is_foreign_key => 1,
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "codpais",
  { data_type => "char", is_foreign_key => 1, is_nullable => 0, size => 3 },
  "publicol",
  { data_type => "char", is_nullable => 0, size => 1 },
  "criadorl",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 0, size => 100 },
  "m18",
  { data_type => "char", is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("idlocal");

=head1 RELATIONS

=head2 eventoes

Type: has_many

Related object: L<socialEvents::Schema::Result::Evento>

=cut

__PACKAGE__->has_many(
  "eventoes",
  "socialEvents::Schema::Result::Evento",
  { "foreign.idlocal" => "self.idlocal" },
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

=head2 codtipol

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Tipol>

=cut

__PACKAGE__->belongs_to(
  "codtipol",
  "socialEvents::Schema::Result::Tipol",
  { cod => "codtipol" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 criadorl

Type: belongs_to

Related object: L<socialEvents::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "criadorl",
  "socialEvents::Schema::Result::User",
  { usr => "criadorl" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-23 17:30:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:QJM5AUDDVmsEd44VHZ8hGw


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
