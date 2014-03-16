use Acme::Umlautify 'umlautify';
use Test;
use strict;

BEGIN { plan tests => 3 }; 

ok(umlautify_latin('AEIOUYaeiouy') eq 'ÄËÏÖÜYäëïöüÿ');

my @array = umlautify_latin(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'föö:bär:bäz');
