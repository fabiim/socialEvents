package socialEvents::Schema::Result::Amigosincritosevento;

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

socialEvents::Schema::Result::Amigosincritosevento

=cut

__PACKAGE__->table("amigosincritoseventos");

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


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-02-01 20:37:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:9I9z91TtlClwTR228rH9Qg

__PACKAGE__->belongs_to(
  "idevento",
  "socialEvents::Schema::Result::Evento",
  { idevento => "idevento" },
    { is_deferrable => 1 },
);

__PACKAGE__->belongs_to(
  "usr",
  "socialEvents::Schema::Result::User",
    { usr => "usr" },
    { is_deferrable => 1},
);



# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
