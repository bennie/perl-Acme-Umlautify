=head1 N�M�:

Acme::Umlautify - �dd �ml��ts t� �v�r�th�ng!

=head1 SYN�PS�S:

Acme::Umlautify �ff�rs b�th �n �bj�ct �nd �xp�rt�d m�th�d �nt�rf�c� t� 
tr�nsf�rm str�ngs �f t�xt �nt� z�n �f �xc�ss�v� �ml�t��g�.

=head1 �S�G�:

�xp�rt�d M�th�d �s�g�:

  use Acme::Umlautify 'umlautify';

  print umlautify('Yea verily umlatus doth rock, dude.');

�bj�ct �r��nt�d �s�g�:

  use Acme::Umlautify;

  my $au = new Acme::Umlautify;

  print $au->do('"Motley Crue" could have had way more umlauts, dude.');

�n ��th�r c�s�, g�v�n �n �rr�� �f �np�t str�ngs, � c�rr�sp�nd�ng �rr�� �s
r�t�rn�d l��k�ng f�r c��l�r. �n � sc�l� �f �n� t� t�n �t's �n �L�V�N.

=head1 KN�WN �SS��S:

Ch�r�ct�rs �r� s�mpl� m�pp�d t� th� c�rr�sp�nd�ng chr() c�d�s:

  � = 196   � = 203   � = 207   � = 214   � = 220   � = 228 
  � = 235   � = 239   � = 246   � = 252   � = 255

Th�r� �pp��rs t� b� n� c�p�t�l Y w�th �ml�t�s.

�dd�t��n�ll�, th��gh r�q��st�d th�r� �pp��rs t� b� n� N w�th �ml��ts. F�ns
�f Sp�n�l T�p w�ll j�st h�v� t� �pd�t� th��r t�rm�n�ls w�th �nk.

R�ck �n!

=head1 ��TH�RSH�P:

  Acme::Umlautify v1.00 2004/04/07

  (c) 2004, Phillip Pollard <bennie@cpan.org>
  Released under the m�st �xc�ll�nt Perl Artistic License

  �dd�t��n�l bl�m� (f�r th� �d��) g��s t�:
  Kristina Davis <krd@menagerie.tf>
  Chip Salzenberg <chip@pobox.com>

=cut

package Acme::Umlautify;
$Acme::Umlautify::VERSION = '1.00';

require Exporter;
require DynaLoader;
use strict;

push our @ISA, 'Exporter';
our @EXPORT_OK = 'umlautify';

# What about? 
# � = 192 � = 193 � = 194 � = 195 � = 197 � = 198 � = 199 � = 200 � = 192 
# � = 201 � = 202 � = 204 � = 205 � = 206 � = 208 � = 209 � = 210 � = 211
# � = 212 � = 213 � = 215 � = 216 � = 217 � = 218 � = 219 � = 221 � = 222
# � = 223 � = 224 � = 225 � = 226 � = 227 � = 229 � = 230 � = 231 � = 232
# � = 233 � = 234 � = 236 � = 237 � = 238 � = 240 � = 241 � = 242 � = 243
# � = 244 � = 245 � = 247 � = 248 � = 249 � = 250 � = 251 � = 253 � = 254

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
