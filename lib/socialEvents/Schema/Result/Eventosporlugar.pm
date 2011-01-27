package socialEvents::Schema::Result::Eventosporlugar;

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

socialEvents::Schema::Result::Eventosporlugar

=cut

__PACKAGE__->table("eventosporlugar");

=head1 ACCESSORS

=head2 idlocal

  data_type: 'integer'
  is_nullable: 1
  original: {data_type => "number",size => [38,0]}

=head2 idevento

  data_type: 'numeric'
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=cut

__PACKAGE__->add_columns(
  "idlocal",
  {
    data_type   => "integer",
    is_nullable => 1,
    original    => { data_type => "number", size => [38, 0] },
  },
  "idevento",
  {
    data_type => "numeric",
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-23 17:30:58
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:s1Y77mGEONQPH4ldgG7gaQ


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
