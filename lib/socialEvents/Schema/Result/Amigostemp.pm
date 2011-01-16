package socialEvents::Schema::Result::Amigostemp;

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

socialEvents::Schema::Result::Amigostemp

=cut

__PACKAGE__->table("amigostemp");

=head1 ACCESSORS

=head2 usr

  data_type: 'varchar2'
  is_nullable: 1
  size: 100

=head2 amigo

  data_type: 'varchar2'
  is_nullable: 1
  size: 100

=cut

__PACKAGE__->add_columns(
  "usr",
  { data_type => "varchar2", is_nullable => 1, size => 100 },
  "amigo",
  { data_type => "varchar2", is_nullable => 1, size => 100 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:bU2EEMLCugtGkNms85OKGA


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
