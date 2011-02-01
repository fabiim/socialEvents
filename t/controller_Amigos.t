use strict;
use warnings;
use Test::More;


use Catalyst::Test 'socialEvents';
use socialEvents::Controller::Amigos;

ok( request('/amigos')->is_success, 'Request should succeed' );
done_testing();
