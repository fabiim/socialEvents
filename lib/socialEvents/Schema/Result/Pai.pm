package socialEvents::Schema::Result::Pai;

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

socialEvents::Schema::Result::Pai

=cut

__PACKAGE__->table("pais");

=head1 ACCESSORS

=head2 codpais

  data_type: 'char'
  is_nullable: 0
  size: 3

=head2 descpais

  data_type: 'varchar2'
  is_nullable: 0
  size: 50

=cut

__PACKAGE__->add_columns(
  "codpais",
  { data_type => "char", is_nullable => 0, size => 3 },
  "descpais",
  { data_type => "varchar2", is_nullable => 0, size => 50 },
);
__PACKAGE__->set_primary_key("codpais");

=head1 RELATIONS

=head2 locais

Type: has_many

Related object: L<socialEvents::Schema::Result::Locai>

=cut

__PACKAGE__->has_many(
  "locais",
  "socialEvents::Schema::Result::Locai",
  { "foreign.codpais" => "self.codpais" },
  { cascade_copy => 0, cascade_delete => 0 },
);

=head2 users

Type: has_many

Related object: L<socialEvents::Schema::Result::User>

=cut

__PACKAGE__->has_many(
  "users",
  "socialEvents::Schema::Result::User",
  { "foreign.codpais" => "self.codpais" },
  { cascade_copy => 0, cascade_delete => 0 },
);


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-01-16 16:24:23
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:l1LklkvgtmH1IeVLQ5D81Q


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
