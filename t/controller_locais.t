use strict;
use warnings;
use Test::More;


use Catalyst::Test 'socialEvents';
use socialEvents::Controller::locais;

ok( request('/locais')->is_success, 'Request should succeed' );
done_testing();
