use Acme::Umlautify;
use Test;
use strict;

BEGIN { plan tests => 4 }; 

my $au = new Acme::Umlautify;

ok($au);

ok($au->do('AEIOUYaeiouy') eq 'ÄËÏÖÜYäëïöüÿ');

my @array = $au->do(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'föö:bär:bäz');
