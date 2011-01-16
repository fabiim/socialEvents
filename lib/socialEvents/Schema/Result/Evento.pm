package socialEvents::Schema::Result::Evento;

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

socialEvents::Schema::Result::Evento

=cut

__PACKAGE__->table("evento");

=head1 ACCESSORS

=head2 idevento

  is_auto_increment: 1
  is_nullable: 0
  sequence: 'idevento'

=head2 nomee

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 cape

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: 126

=head2 precoe

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: [9,2]

=head2 privpube

  data_type: 'varchar2'
  is_nullable: 0
  size: 4

=head2 duracao

  data_type: 'numeric'
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 datai

  data_type: 'datetime'
  is_nullable: 0
  original: {data_type => "date"}

=head2 codtipoe

  data_type: 'numeric'
  is_foreign_key: 1
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 desce

  data_type: 'varchar2'
  is_nullable: 0
  size: 1000

=head2 criadore

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
  "idevento",
  { is_auto_increment => 1, is_nullable => 0, sequence => "idevento" },
  "nomee",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "cape",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => 126,
  },
  "precoe",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => [9, 2],
  },
  "privpube",
  { data_type => "varchar2", is_nullable => 0, size => 4 },
  "duracao",
  {
    data_type => "numeric",
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "datai",
  {
    data_type   => "datetime",
    is_nullable => 0,
    original    => { data_type => "date" },
  },
  "codtipoe",
  {
    data_type => "numeric",
    is_foreign_key => 1,
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "desce",
  { data_type => "varchar2", is_nullable => 0, size => 1000 },
  "criadore",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 0, size => 100 },
  "m18",
  { data_type => "char", is_nullable => 0, size => 1 },
);
__PACKAGE__->set_primary_key("idevento");

=head1 RELATIONS

=head2 e_fois

Type: has_many

Related object: L<socialEvents::Schema::Result::EFoi>

=cut

__PACKAGE__->has_many(
  "e_fois",
  "socialEvents::Schema::Result::EFoi",
  { "foreign.idevento" => "self.idevento" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 e_inscritoes

Type: has_many

Related object: L<socialEvents::Schema::Result::EInscrito>

=cut

__PACKAGE__->has_many(
  "e_inscritoes",
  "socialEvents::Schema::Result::EInscrito",
  { "foreign.idevento" => "self.idevento" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 criadore

Type: belongs_to

Related object: L<socialEvents::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "criadore",
  "socialEvents::Schema::Result::User",
  { usr => "criadore" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 codtipoe

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Tipoe>

=cut

__PACKAGE__->belongs_to(
  "codtipoe",
  "socialEvents::Schema::Result::Tipoe",
  { codtipoe => "codtipoe" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 local_eventoes

Type: has_many

Related object: L<socialEvents::Schema::Result::LocalEvento>

=cut

__PACKAGE__->has_many(
  "local_eventoes",
  "socialEvents::Schema::Result::LocalEvento",
  { "foreign.idevento" => "self.idevento" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:cm44x4w7rRHO5CzldthndQ


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
