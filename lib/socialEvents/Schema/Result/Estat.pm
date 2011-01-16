package socialEvents::Schema::Result::Estat;

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

socialEvents::Schema::Result::Estat

=cut

__PACKAGE__->table("estat");

=head1 ACCESSORS

=head2 descr

  data_type: 'varchar2'
  is_nullable: 0
  size: 30

=head2 qtd

  data_type: 'numeric'
  is_nullable: 1
  original: {data_type => "number"}
  size: 126

=cut

__PACKAGE__->add_columns(
  "descr",
  { data_type => "varchar2", is_nullable => 0, size => 30 },
  "qtd",
  {
    data_type => "numeric",
    is_nullable => 1,
    original => { data_type => "number" },
    size => 126,
  },
);
__PACKAGE__->set_primary_key("descr");


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:BUqbX73FTwrnVVYWk1pqcg


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
