use Acme::Umlautify 'umlautify';
use Test;
use strict;

BEGIN { plan tests => 3 }; 

ok(umlautify('AEIOUYaeiouy') eq 'ÄËÏÖÜYäëïöüÿ');

my @array = umlautify(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'föö:bär:bäz');
