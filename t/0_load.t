use Test;
BEGIN { plan tests => 2 };

use Acme::Umlautify;
ok(1);

my $au = new Acme::Umlautify;
ok(defined $au);
