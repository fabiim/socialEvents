package socialEvents::Schema::Result::Amigosforamevento;

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

socialEvents::Schema::Result::Amigosforamevento

=cut

__PACKAGE__->table("amigosforameventos");

=head1 ACCESSORS

=head2 usr

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=head2 idevento

  data_type: 'numeric'
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 namigos

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: 126

=cut

__PACKAGE__->add_columns(
  "usr",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
  "idevento",
  {
    data_type => "numeric",
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "namigos",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => 126,
  },
);
__PACKAGE__->set_primary_key("usr", "idevento");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-02-02 06:23:06
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:AonquRMX2zEUJdKm5rHf5Q
__PACKAGE__->belongs_to(
  "usr",
  "socialEvents::Schema::Result::User",
  { usr => "usr" },
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


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
