#!/usr/bin/env perl -Ilib

use Acme::Umlautify 'umlautify';
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

  print $au->do(\'"Motley Crue" could have had way more umlauts, dude.\');

' . umlautify('In either case, given an array of input strings, a corresponding array is 
returned looking far cooler. On a scale of one to ten it\'s an ELEVEN!');

my $known = umlautify('Characters are simply mapped to the corresponding') . ' chr() ' . umlautify('codes:') . '

  A = 196   e = 203   i = 207   o = 214   U = 220   A = 228 
  e = 235   i = 239   o = 246   U = 252   Y = 255

' . umlautify('There appears to be no capital Y with umlauts.

Additionally, though requested, there appears to be no N with umlauts. Fans of 
Spinal Tap will just have to update their terminals with ink.');

my $bugs = '	Bug tracking for this module: https://rt.cpan.org/Dist/Display.html?Name=ACME-Umlautify

	Source hosting: http://www.github.com/bennie/perl-ACME-Umlautify';

my $version  = '	Acme::Umlautify vVERSIONTAG (DATETAG)';
my $copy     = '	(c) 2004-YEARTAG, Phillip Pollard <bennie@cpan.org>';

my $license  = 'Released under the ' . umlautify('most excellent') . ' Perl Artistic License

This source code is released under the "Perl Artistic License 2.0," the text of
which is included in the LICENSE file of this distribution. It may also be
reviewed here: http://opensource.org/licenses/artistic-license-2.0';

my $author = umlautify('Additional blame (for the idea) goes to:') . '

  Kristina Davis <krd@menagerie.tf>
  Chip Salzenberg <chip@pobox.com>';

### README

print "Writing README\n";

open README, '>', 'README' or die "Can't open README for writing.";

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
".umlautify('KNOWN ISSUES:')."
================================================================================

$known

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
print OUTFILE $module;
print OUTFILE "

=encoding Latin-1

=head1 NAME:

Acme::Umlautify - $abstract

=head1 " . umlautify('SYNOPSIS:') . "

$synopsis

=head1 " . umlautify('USAGE:') . "

$usage

=head1 ".umlautify('KNOWN ISSUES:') . "

$known

=head1 ".umlautify('BUGS AND SOURCE:') . "

$bugs

=head1 VERSION:

$version

=head1 COPYRIGHT:

$copy

=head1 LICENSE:

$license

=head1 ".umlautify('AUTHORSHIP:')."

$author

";
close OUTFILE;