use Acme::Umlautify 'umlautify';
use Test;
use strict;

BEGIN { plan tests => 3 }; 

ok(umlautify('AEIOUYaeiouy') eq '�����Y������');

my @array = umlautify(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'f��:b�r:b�z');
