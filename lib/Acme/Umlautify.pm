package Acme::Umlautify;
$Acme::Umlautify::VERSION = 'VERSIONTAG';

require Exporter;
require DynaLoader;

use utf8;
use warnings;
use strict;

push our @ISA, 'Exporter';
our @EXPORT = qw/umlautify umlautify_latin/;
our @EXPORT_OK = qw/umlautify umlautify_latin/;

our %map = ( A => 196, E => 203, I => 207, O => 214, U => 220, a => 228,
             e => 235, i => 239, o => 246, u => 252, y => 255 );

sub new {
  bless({},$_[0]);
}

sub do {
  my $self = shift @_;
  return $self->umlautify(@_);
}

sub umlautify {
  shift @_ if ref $_[0] eq 'Acme::Umlautify';
  my @out = map { join '', map { $_ =~ /[\s\t\n]/ ? $_ : "$_\x{0308}" } split '', $_; } @_;
  return wantarray ? @out : $out[0];
}

sub umlautify_latin {
  shift @_ if ref $_[0] eq 'Acme::Umlautify';
  our %map;
  my @out = map { join '', map { $_=chr($map{$_}) if $map{$_}; $_ } split '', $_; } @_;
  return wantarray ? @out : $out[0];
}

__END__

=encoding utf8

=head1 NAME:

Acme::Umlautify - Äd̈d̈ Üm̈l̈äüẗs̈ ẗö ëv̈ër̈ÿẗḧïn̈g̈!̈

=head1 S̈ŸN̈ÖP̈S̈ÏS̈:̈

Acme::Umlautify öf̈f̈ër̈s̈ b̈öẗḧ än̈ öb̈j̈ëc̈ẗ-̈ör̈ïën̈ẗëd̈ ïn̈ẗër̈f̈äc̈ë än̈d̈ än̈ ëẍp̈ör̈ẗëd̈ m̈ëẗḧöd̈
ẗö ẗr̈än̈s̈f̈ör̈m̈ s̈ẗr̈ïn̈g̈s̈ öf̈ ẗëẍẗ ïn̈ẗö ẗḧë z̈ën̈ öf̈ ëẍc̈ës̈s̈ïv̈ë üm̈l̈äẗäüg̈ë.̈

=head1 ÜS̈ÄG̈Ë:̈

Ëẍp̈ör̈ẗëd̈ M̈ëẗḧöd̈ Üs̈äg̈ë:̈

  use Acme::Umlautify 'umlautify';

  print umlautify('Yea verily umlauts doth rock, dude.');

Öb̈j̈ëc̈ẗ-̈Ör̈ïën̈ẗëd̈ Üs̈äg̈ë:̈

  use Acme::Umlautify;

  my $au = new Acme::Umlautify;

  print $au->umlautify('"Motley Crue" could have had way more umlauts, dude.');

Ïn̈ ëïẗḧër̈ c̈äs̈ë,̈ g̈ïv̈ën̈ än̈ är̈r̈äÿ öf̈ ïn̈p̈üẗ s̈ẗr̈ïn̈g̈s̈,̈ ä c̈ör̈r̈ës̈p̈ön̈d̈ïn̈g̈ är̈r̈äÿ ïs̈
r̈ëẗür̈n̈ëd̈ l̈öök̈ïn̈g̈ f̈är̈ c̈ööl̈ër̈.̈ Ön̈ ä s̈c̈äl̈ë öf̈ ön̈ë ẗö ẗën̈ ïẗ'̈s̈ än̈ ËL̈ËV̈ËN̈!̈

=head1 L̈ÄT̈ÏN̈ M̈ÖD̈Ë:̈

B̈ÿ d̈ëf̈äül̈ẗ,̈ üm̈l̈äüẗs̈ äd̈d̈ëd̈ ẗö äl̈l̈ n̈ön̈-̈s̈p̈äc̈ë c̈ḧär̈äc̈ẗër̈s̈ b̈ÿ m̈äp̈p̈ïn̈g̈ ẗḧëm̈ ẗö 
ÜT̈F̈-̈8̈ c̈ḧär̈äc̈ẗër̈s̈.̈ Äs̈ ẅïẗḧ äl̈l̈ ḧän̈d̈l̈ïn̈g̈ öf̈ ÜT̈F̈,̈ ẗḧïs̈ m̈äÿ ör̈ m̈äÿ n̈öẗ c̈äüs̈ë ïs̈s̈üës̈.̈

Ïn̈ öl̈d̈ër̈ v̈ër̈s̈ïön̈s̈ öf̈ ẗḧïs̈ m̈öd̈ül̈ë,̈ ä L̈äẗïn̈-̈1̈ ën̈c̈öd̈ïn̈g̈ ẗëc̈ḧn̈ïq̈üë ẅäs̈ üs̈ëd̈.̈ C̈ḧär̈äc̈ẗër̈s̈ 
ẅër̈ë s̈ïm̈p̈l̈ÿ m̈äp̈p̈ëd̈ ẗö ẗḧës̈ë c̈ör̈r̈ës̈p̈ön̈d̈ïn̈g̈ chr() c̈öd̈ës̈:̈

  A = 196   e = 203   i = 207   o = 214   U = 220   A = 228
  e = 235   i = 239   o = 246   U = 252   Y = 255

T̈ḧïs̈ l̈ëf̈ẗ üs̈ ẅïẗḧ ẗḧë s̈ïẗüäẗïön̈ ẅḧër̈ë ẗḧër̈ë ẅäs̈ n̈ö l̈öẅër̈-̈c̈äs̈ë ÿ ẅïẗḧ
üm̈l̈äüẗs̈.̈ Än̈d̈ f̈ör̈ f̈än̈s̈ öf̈ S̈p̈ïn̈äl̈ T̈äp̈,̈ ẗḧër̈ë ẅäs̈ n̈ö N̈ ẅïẗḧ üm̈l̈äüẗs̈.̈ T̈ḧëÿ ẅër̈ë 
s̈ẗüc̈k̈ üp̈d̈äẗïn̈g̈ ẗḧëïr̈ ẗër̈m̈ïn̈äl̈s̈ m̈än̈üäl̈l̈ÿ ẅïẗḧ ïn̈k̈.̈

Ïf̈ ÿöü ẅïs̈ḧ ẗö üs̈ë ẗḧïs̈ öl̈d̈ër̈,̈ l̈ës̈s̈ äẅës̈öm̈ë,̈ L̈äẗïn̈-̈1̈ ën̈c̈öd̈ïn̈g̈,̈ ïẗ ïs̈ äv̈äïl̈äb̈l̈ë äs̈
ä m̈ëẗḧöd̈ än̈d̈ äl̈s̈ö ëẍp̈ör̈ẗëd̈ äs̈umlautify_latin()

=head1 B̈ÜG̈S̈ ÄN̈D̈ S̈ÖÜR̈C̈Ë:̈

	B̈üg̈ ẗr̈äc̈k̈ïn̈g̈ f̈ör̈ ẗḧïs̈ m̈öd̈ül̈ë:̈ https://rt.cpan.org/Dist/Display.html?Name=ACME-Umlautify

	S̈öür̈c̈ë ḧös̈ẗïn̈g̈:̈ http://www.github.com/bennie/perl-ACME-Umlautify

=head1 V̈ËR̈S̈ÏÖN̈:̈

	Acme::Umlautify vVERSIONTAG (DATETAG)

=head1 C̈ÖP̈ŸR̈ÏG̈ḦT̈:̈

	(c) 2004-YEARTAG, Phillip Pollard <bennie@cpan.org>

=head1 LICENSE:

Released under the m̈ös̈ẗ ëẍc̈ël̈l̈ën̈ẗ Perl Artistic License

This source code is released under the "Perl Artistic License 2.0," the text of
which is included in the LICENSE file of this distribution. It may also be
reviewed here: http://opensource.org/licenses/artistic-license-2.0

=head1 ÄÜT̈ḦÖR̈S̈ḦÏP̈:̈

ÜT̈F̈ ïm̈p̈l̈ëm̈ën̈ẗäẗïön̈ ẗëc̈ḧn̈ïq̈üë än̈d̈ s̈üg̈g̈ës̈ẗïön̈s̈ f̈r̈öm̈:̈

  Jeremy Mates <jmates@uw.edu>
  Nick Wellnhofer <nwellnhof@cpan.org>

Äd̈d̈ïẗïön̈äl̈ b̈l̈äm̈ë (̈f̈ör̈ ẗḧë ïd̈ëä)̈ g̈öës̈ ẗö:̈

  Kristina Davis <krd@menagerie.tf>
  Chip Salzenberg <chip@pobox.com>

