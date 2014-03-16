use Acme::Umlautify 'umlautify_latin';
use Test::Simple tests => 3;
use strict;

ok(umlautify_latin('AEIOUYaeiouy') eq '�����Y������');

my @array = umlautify_latin(qw/foo bar baz/);
my $test  = join ':', @array;

ok(scalar(@array) == 3);
ok($test eq 'f��:b�r:b�z');
