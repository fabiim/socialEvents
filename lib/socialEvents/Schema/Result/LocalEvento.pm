package socialEvents::Schema::Result::LocalEvento;

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

socialEvents::Schema::Result::LocalEvento

=cut

__PACKAGE__->table("local_evento");

=head1 ACCESSORS

=head2 idevento

  data_type: 'numeric'
  is_foreign_key: 1
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 idlocal

  data_type: 'numeric'
  is_foreign_key: 1
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=cut

__PACKAGE__->add_columns(
  "idevento",
  {
    data_type => "numeric",
    is_foreign_key => 1,
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "idlocal",
  {
    data_type => "numeric",
    is_foreign_key => 1,
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
);
__PACKAGE__->set_primary_key("idevento", "idlocal");

=head1 RELATIONS

=head2 idlocal

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Locai>

=cut

__PACKAGE__->belongs_to(
  "idlocal",
  "socialEvents::Schema::Result::Locai",
  { idlocal => "idlocal" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 idevento

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Evento>

=cut

__PACKAGE__->belongs_to(
  "idevento",
  "socialEvents::Schema::Result::Evento",
  { idevento => "idevento" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:eOia+glcTWbBV2MvAnuG3w


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
