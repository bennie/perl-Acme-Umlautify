=head1 NAME:

Acme::Umlautify - Ädd ümläüts tö ëvërÿthïng!

=head1 SYNÖPSÏS:

Acme::Umlautify öffërs böth än öbjëct änd ëxpörtëd mëthöd ïntërfäcë tö 
tränsförm strïngs öf tëxt ïntö zën öf ëxcëssïvë ümlätüägë.

=head1 ÜSÄGË:

Ëxpörtëd Mëthöd Üsägë:

  use Acme::Umlautify 'umlautify';

  print umlautify('Yea verily umlauts doth rock, dude.');

Öbjëct Örïëntëd Üsägë:

  use Acme::Umlautify;

  my $au = new Acme::Umlautify;

  print $au->do('"Motley Crue" could have had way more umlauts, dude.');

Ïn ëïthër cäsë, gïvën än ärräÿ öf ïnpüt strïngs, ä cörrëspöndïng ärräÿ ïs
rëtürnëd löökïng fär cöölër. Ön ä scälë öf önë tö tën ït's än ËLËVËN.

=head1 KNÖWN ÏSSÜËS:

Chäräctërs ärë sïmplÿ mäppëd tö thë cörrëspöndïng chr() cödës:

  Ä = 196   Ë = 203   Ï = 207   Ö = 214   Ü = 220   ä = 228 
  ë = 235   ï = 239   ö = 246   ü = 252   ÿ = 255

Thërë äppëärs tö bë nö cäpïtäl Y wïth ümläüts.

Äddïtïönällÿ, thöügh rëqüëstëd thërë äppëärs tö bë nö N wïth ümläüts. Fäns
öf Spïnäl Täp wïll jüst hävë tö üpdätë thëïr tërmïnäls wïth ïnk.

Röck ön!

=head1 BUGS AND SOURCE

	Bug tracking for this module: https://rt.cpan.org/Dist/Display.html?Name=ACME-Umlautify

	Source hosting: http://www.github.com/bennie/perl-ACME-Umlautify

=head1 VERSION

	Acme::Umlautify vVERSIONTAG (DATETAG)

=head1 COPYRIGHT

	(c) 2004-YEARTAG, Phillip Pollard <bennie@cpan.org>

=head1 LICENSE

Released under the möst ëxcëllënt Perl Artistic License

This source code is released under the "Perl Artistic License 2.0," the text of
which is included in the LICENSE file of this distribution. It may also be
reviewed here: http://opensource.org/licenses/artistic-license-2.0

=head1 ÄÜTHÖRSHÏP

  Äddïtïönäl blämë (för thë ïdëä) göës tö:
  Kristina Davis <krd@menagerie.tf>
  Chip Salzenberg <chip@pobox.com>

=cut

package Acme::Umlautify;
$Acme::Umlautify::VERSION = 'VERSIONTAG';

require Exporter;
require DynaLoader;
use strict;

push our @ISA, 'Exporter';
our @EXPORT_OK = 'umlautify';

# What about? 
# À = 192 Á = 193 Â = 194 Ã = 195 Å = 197 Æ = 198 Ç = 199 È = 200 À = 192 
# É = 201 Ê = 202 Ì = 204 Í = 205 Î = 206 Ð = 208 Ñ = 209 Ò = 210 Ó = 211
# Ô = 212 Õ = 213 × = 215 Ø = 216 Ù = 217 Ú = 218 Û = 219 Ý = 221 Þ = 222
# ß = 223 à = 224 á = 225 â = 226 ã = 227 å = 229 æ = 230 ç = 231 è = 232
# é = 233 ê = 234 ì = 236 í = 237 î = 238 ð = 240 ñ = 241 ò = 242 ó = 243
# ô = 244 õ = 245 ÷ = 247 ø = 248 ù = 249 ú = 250 û = 251 ý = 253 þ = 254

our %map = ( A => 196, E => 203, I => 207, O => 214, U => 220, a => 228,
             e => 235, i => 239, o => 246, u => 252, y => 255 );

sub new {
  bless({},$_[0]);
}

sub do {
  my $self = shift @_;
  our %map;
  my @out = map { join '', map { $_=chr($map{$_}) if $map{$_}; $_ } split '', $_; } @_;
  return wantarray ? @out : $out[0];
}

sub umlautify {
  our %map;
  my @out = map { join '', map { $_=chr($map{$_}) if $map{$_}; $_ } split '', $_; } @_;
  return wantarray ? @out : $out[0];
}
