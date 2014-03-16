#!/usr/bin/env perl -Ilib

use Acme::Umlautify;
use File::Slurp;
use strict;

my $abstract =  umlautify('Add Umlauts to everything!');
my $synopsis =  'Acme::Umlautify '. umlautify('offers both an object-oriented interface and an exported method
to transform strings of text into the zen of excessive umlatauge.');

my $usage = umlautify('Exported Method Usage:') . '

  use Acme::Umlautify \'umlautify\';

  print umlautify(\'Yea verily umlauts doth rock, dude.\');

' . umlautify('Object-Oriented Usage:') . '

  use Acme::Umlautify;

  my $au = new Acme::Umlautify;

  print $au->umlautify(\'"Motley Crue" could have had way more umlauts, dude.\');

' . umlautify('In either case, given an array of input strings, a corresponding array is
returned looking far cooler. On a scale of one to ten it\'s an ELEVEN!');

my $latin = umlautify('By default, umlauts added to all non-space characters by mapping them to 
UTF-8 characters. As with all handling of UTF, this may or may not cause issues.

In older versions of this module, a Latin-1 encoding technique was used. Characters 
were simply mapped to these corresponding') . ' chr() ' . umlautify('codes:') . '

  A = 196   e = 203   i = 207   o = 214   U = 220   A = 228
  e = 235   i = 239   o = 246   U = 252   Y = 255

' . umlautify('This left us with the situation where there was no lower-case y with
umlauts. And for fans of Spinal Tap, there was no N with umlauts. They were 
stuck updating their terminals manually with ink.

If you wish to use this older, less awesome, Latin-1 encoding, it is available as
a method and also exported as').'umlautify_latin()';

my $bugs = umlautify('	Bug tracking for this module:').' https://rt.cpan.org/Dist/Display.html?Name=ACME-Umlautify

	'.umlautify('Source hosting:').' http://www.github.com/bennie/perl-ACME-Umlautify';

my $version  = '	Acme::Umlautify vVERSIONTAG (DATETAG)';
my $copy     = '	(c) 2004-YEARTAG, Phillip Pollard <bennie@cpan.org>';

my $license  = 'Released under the ' . umlautify('most excellent') . ' Perl Artistic License

This source code is released under the "Perl Artistic License 2.0," the text of
which is included in the LICENSE file of this distribution. It may also be
reviewed here: http://opensource.org/licenses/artistic-license-2.0';

my $author = umlautify('UTF implementation technique and suggestions from:').'

  Jeremy Mates <jmates@uw.edu>
  Nick Wellnhofer <nwellnhof@cpan.org>

'.umlautify('Additional blame (for the idea) goes to:') . '

  Kristina Davis <krd@menagerie.tf>
  Chip Salzenberg <chip@pobox.com>';

### README

print "Writing README\n";

open README, '>', 'README' or die "Can't open README for writing.";
binmode README, ':utf8';

print README "

             Acme::Umlautify - $abstract - vVERSIONTAG

================================================================================
".umlautify('SYNOPSIS:')."
================================================================================

$synopsis

================================================================================
".umlautify('INSTALLATION:').'
================================================================================

'.umlautify('To install this module type the following:').'

   perl Makefile.PL
   make
   make test
   make install

================================================================================
'.umlautify('USAGE:')."
================================================================================

$usage

================================================================================
".umlautify('LATIN MODE:')."
================================================================================

$latin

================================================================================
".umlautify('VERSION:')."
================================================================================

$version

================================================================================
".umlautify('COPYRIGHT:')."
================================================================================

$copy

================================================================================
".umlautify('LICENSE:')."
================================================================================

$license

================================================================================
".umlautify('AUTHORSHIP:')."
================================================================================

$author
";
close README;

### POD

print "Writing the POD\n";

my $module = read_file('lib/Acme/Umlautify.pm');
die "Can't find end token" unless $module =~ /^(.+__END__)/ms;
$module = $1;

open OUTFILE, '>', 'lib/Acme/Umlautify.pm';
binmode OUTFILE, ':utf8';

print OUTFILE $module;
print OUTFILE "

=encoding utf8

=head1 NAME:

Acme::Umlautify - $abstract

=head1 " . umlautify('SYNOPSIS:') . "

$synopsis

=head1 " . umlautify('USAGE:') . "

$usage

=head1 ".umlautify('LATIN MODE:') . "

$latin

=head1 ".umlautify('BUGS AND SOURCE:') . "

$bugs

=head1 ".umlautify('VERSION:') . "

$version

=head1 ".umlautify('COPYRIGHT:') . "

$copy

=head1 LICENSE:

$license

=head1 ".umlautify('AUTHORSHIP:')."

$author

";
close OUTFILE;
