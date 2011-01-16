package socialEvents::Schema::Result::Amigo;

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

socialEvents::Schema::Result::Amigo

=cut

__PACKAGE__->table("amigos");

=head1 ACCESSORS

=head2 usr

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 0
  size: 100

=head2 amigo

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 0
  size: 100

=cut

__PACKAGE__->add_columns(
  "usr",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 0, size => 100 },
  "amigo",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 0, size => 100 },
);
__PACKAGE__->set_primary_key("usr", "amigo");

=head1 RELATIONS

=head2 amigo

Type: belongs_to

Related object: L<socialEvents::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "amigo",
  "socialEvents::Schema::Result::User",
  { usr => "amigo" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);

=head2 usr

Type: belongs_to

Related object: L<socialEvents::Schema::Result::User>

=cut

__PACKAGE__->belongs_to(
  "usr",
  "socialEvents::Schema::Result::User",
  { usr => "usr" },
  { is_deferrable => 1, on_delete => "CASCADE", on_update => "CASCADE" },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:zsmWAihck9c1OEHrcKyc/g


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
