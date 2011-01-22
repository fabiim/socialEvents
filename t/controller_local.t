use strict;
use warnings;
use Test::More;


use Catalyst::Test 'socialEvents';
use socialEvents::Controller::local;

ok( request('/local')->is_success, 'Request should succeed' );
done_testing();
