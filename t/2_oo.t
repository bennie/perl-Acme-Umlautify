use Acme::Umlautify;
use Test;
use strict;

BEGIN { plan tests => 4 }; 

my $au = new Acme::Umlautify;

ok($au);

ok($au->do('AEIOUYaeiouy') eq '�����Y������');

my @array = $au->do(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'f��:b�r:b�z');
