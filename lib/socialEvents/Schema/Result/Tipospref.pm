package socialEvents::Schema::Result::Tipospref;

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

socialEvents::Schema::Result::Tipospref

=cut

__PACKAGE__->table("tipospref");

=head1 ACCESSORS

=head2 usr

  data_type: 'varchar2'
  is_foreign_key: 1
  is_nullable: 0
  size: 100

=head2 tipoepref

  data_type: 'numeric'
  is_foreign_key: 1
  is_nullable: 0
  original: {data_type => "number"}
  size: 126

=cut

__PACKAGE__->add_columns(
  "usr",
  { data_type => "varchar2", is_foreign_key => 1, is_nullable => 0, size => 100 },
  "tipoepref",
  {
    data_type => "numeric",
    is_foreign_key => 1,
    is_nullable => 0,
    original => { data_type => "number" },
    size => 126,
  },
);
__PACKAGE__->set_primary_key("usr");

=head1 RELATIONS

=head2 tipoepref

Type: belongs_to

Related object: L<socialEvents::Schema::Result::Tipoe>

=cut

__PACKAGE__->belongs_to(
  "tipoepref",
  "socialEvents::Schema::Result::Tipoe",
  { cod => "tipoepref" },
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


# Created by DBIx::Class::Schema::Loader v0.07002 @ 2011-02-01 20:37:41
# DO NOT MODIFY THIS OR ANYTHING ABOVE! md5sum:oL35YQ4C8a/8F/V6vzrEng


# You can replace this text with custom content, and it will be preserved on regeneration
__PACKAGE__->meta->make_immutable;
1;
