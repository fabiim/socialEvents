package socialEvents::Schema::Result::Einscritosfuturo;

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

socialEvents::Schema::Result::Einscritosfuturo

=cut

__PACKAGE__->table("einscritosfuturos");

=head1 ACCESSORS

=head2 idevento

  data_type: 'numeric'
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=head2 usr

  data_type: 'varchar2'
  is_nullable: 0
  size: 100

=cut

__PACKAGE__->add_columns(
  "idevento",
  {
    data_type => "numeric",
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
  "usr",
  { data_type => "varchar2", is_nullable => 0, size => 100 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-02-01 20:37:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:TxcYC84wAusTaqdIiujzpQ


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
