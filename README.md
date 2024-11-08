# Acme::Umlautify (vVERSIONTAG)

Äd̈d̈ Üm̈l̈äüẗs̈ ẗö ëv̈ër̈ÿẗḧïn̈g̈!̈ 

## S̈ŸN̈ÖP̈S̈ÏS̈:̈

Acme::Umlautify öf̈f̈ër̈s̈ b̈öẗḧ än̈ öb̈j̈ëc̈ẗ-̈ör̈ïën̈ẗëd̈ ïn̈ẗër̈f̈äc̈ë än̈d̈ än̈ ëẍp̈ör̈ẗëd̈ m̈ëẗḧöd̈
ẗö ẗr̈än̈s̈f̈ör̈m̈ s̈ẗr̈ïn̈g̈s̈ öf̈ ẗëẍẗ ïn̈ẗö ẗḧë z̈ën̈ öf̈ ëẍc̈ës̈s̈ïv̈ë üm̈l̈äẗäüg̈ë.̈

## ÏN̈S̈T̈ÄL̈L̈ÄT̈ÏÖN̈:̈

T̈ö ïn̈s̈ẗäl̈l̈ ẗḧïs̈ m̈öd̈ül̈ë ẗÿp̈ë ẗḧë f̈öl̈l̈öẅïn̈g̈:̈

```
perl Makefile.PL
make
make test
make install
```

## ÜS̈ÄG̈Ë:̈

### Ëẍp̈ör̈ẗëd̈ M̈ëẗḧöd̈ Üs̈äg̈ë:̈

```
use Acme::Umlautify 'umlautify';

print umlautify('Yea verily umlauts doth rock, dude.');
```

### Öb̈j̈ëc̈ẗ-̈Ör̈ïën̈ẗëd̈ Üs̈äg̈ë:̈

```
use Acme::Umlautify;

my $au = new Acme::Umlautify;

print $au->umlautify('"Motley Crue" could have had way more umlauts, dude.');
```

Ïn̈ ëïẗḧër̈ c̈äs̈ë,̈ g̈ïv̈ën̈ än̈ är̈r̈äÿ öf̈ ïn̈p̈üẗ s̈ẗr̈ïn̈g̈s̈,̈ ä c̈ör̈r̈ës̈p̈ön̈d̈ïn̈g̈ är̈r̈äÿ ïs̈
r̈ëẗür̈n̈ëd̈ l̈öök̈ïn̈g̈ f̈är̈ c̈ööl̈ër̈.̈ Ön̈ ä s̈c̈äl̈ë öf̈ ön̈ë ẗö ẗën̈ ïẗ'̈s̈ än̈ ËL̈ËV̈ËN̈!̈

## L̈ÄT̈ÏN̈ M̈ÖD̈Ë:̈

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

## T̈ËR̈M̈ÏN̈ÖL̈ÖG̈Ÿ:̈

"̈Ïs̈ ẗḧë ẗër̈m̈ "̈üm̈l̈äüẗ"̈ c̈ör̈r̈ëc̈ẗ?̈ D̈öës̈n̈'̈ẗ ẗḧäẗ ön̈l̈ÿ r̈ëf̈ër̈ ẗö ẗḧë l̈ëẗẗër̈ Ü ẅïẗḧ ẗḧë 
ẗẅö d̈öẗs̈?̈ Ïs̈n̈'̈ẗ ẗḧë ẗër̈m̈ '̈d̈ïäër̈ës̈ïs̈'̈ ẗḧë c̈ör̈r̈ëc̈ẗ n̈äm̈ë?̈"̈

Ÿës̈.̈ N̈ö.̈ Än̈d̈ p̈ös̈s̈ïb̈l̈ÿ.̈

F̈ïr̈s̈ẗ öf̈ äl̈l̈,̈ ẗḧës̈ë ëẍẗr̈ä m̈är̈k̈ïn̈g̈s̈ är̈öün̈d̈ l̈ëẗẗër̈s̈ är̈ë c̈äl̈l̈ëd̈ d̈ïäc̈r̈ïẗïc̈s̈.̈ Ëäc̈ḧ 
"̈d̈öẗ"̈ öf̈ ẗḧïs̈ s̈p̈ëc̈ïf̈ïc̈ d̈ïäc̈r̈ïẗïc̈ ïs̈ c̈äl̈l̈ëd̈ ä ẗïẗẗl̈ë.̈ T̈ẅö ẗïẗẗl̈ës̈ äp̈p̈l̈ïëd̈ ẗö ẗḧë
ẗöp̈ öf̈ ä l̈ëẗẗër̈ c̈än̈ b̈ë c̈äl̈l̈ëd̈ än̈ üm̈l̈äüẗ,̈ ä ẗr̈ëm̈ä,̈ ör̈ ä d̈ïäër̈ës̈ïs̈.̈ (̈S̈öm̈ëẗïm̈ës̈ 
s̈p̈ël̈l̈ëd̈ d̈ïÃ̈¦̈r̈ës̈ïs̈ ör̈ d̈ïër̈ës̈ïs̈.̈)̈

Ẅḧïl̈ë s̈ÿm̈b̈öl̈ïc̈äl̈l̈ÿ,̈ ẗḧë üm̈l̈äüẗ än̈d̈ ẗḧë d̈ïäër̈ës̈ïs̈ är̈ë r̈ëp̈r̈ës̈n̈ëẗëd̈ ẗḧë s̈äm̈ë ẅäÿ,̈ 
ẗḧëïr̈ m̈ëän̈ïn̈g̈ ïs̈ d̈ïf̈f̈ër̈ën̈ẗ.̈ Ï q̈üöẗë f̈r̈öm̈ ẗḧë Ẅïk̈ïp̈ëd̈ïä är̈ẗïc̈l̈ë:̈

> T̈ḧë d̈ïäër̈ës̈ïs̈ än̈d̈ ẗḧë üm̈l̈äüẗ är̈ë d̈ïäc̈r̈ïẗïc̈s̈ m̈är̈k̈ïn̈g̈ ẗẅö d̈ïs̈ẗïn̈c̈ẗ p̈ḧön̈öl̈ög̈ïc̈äl̈ 
> p̈ḧën̈öm̈ën̈ä.̈ T̈ḧë d̈ïäër̈ës̈ïs̈ r̈ëp̈r̈ës̈ën̈ẗs̈ ẗḧë p̈ḧën̈öm̈ën̈ön̈ äl̈s̈ö k̈n̈öẅn̈ äs̈ d̈ïäër̈ës̈ïs̈,̈ ör̈ 
> ḧïäẗüs̈,̈ ïn̈ ẅḧïc̈ḧ ä v̈öẅël̈ l̈ëẗẗër̈ ïs̈ n̈öẗ p̈r̈ön̈öün̈c̈ëd̈ äs̈ p̈är̈ẗ öf̈ ä d̈ïg̈r̈äp̈ḧ ör̈ d̈ïp̈ḧẗḧön̈g̈.̈ 
> T̈ḧë üm̈l̈äüẗ,̈ ïn̈ c̈ön̈ẗr̈äs̈ẗ,̈ ïn̈d̈ïc̈äẗës̈ ä s̈öün̈d̈ s̈ḧïf̈ẗ.̈ T̈ḧës̈ë ẗẅö d̈ïäc̈r̈ïẗïc̈s̈ ör̈ïg̈ïn̈äẗëd̈ 
> s̈ëp̈är̈äẗël̈ÿ;̈ ẗḧë d̈ïäër̈ës̈ïs̈ ïs̈ c̈ön̈s̈ïd̈ër̈äb̈l̈ÿ öl̈d̈ër̈.̈ N̈ëv̈ër̈ẗḧël̈ës̈s̈,̈ ïn̈ m̈öd̈ër̈n̈ c̈öm̈p̈üẗër̈ 
> s̈ÿs̈ẗëm̈s̈ üs̈ïn̈g̈ Ün̈ïc̈öd̈ë,̈ ẗḧë üm̈l̈äüẗ än̈d̈ d̈ïäër̈ës̈ïs̈ d̈ïäc̈r̈ïẗïc̈s̈ är̈ë ïd̈ën̈ẗïc̈äl̈:̈ 
> â©Ã¤âª (̈c̈öd̈ë p̈öïn̈ẗ Ë4̈1̈6̈,̈ 2̈2̈8̈1̈0̈)̈ r̈ëp̈r̈ës̈ën̈ẗs̈ b̈öẗḧ ä-̈üm̈l̈äüẗ än̈d̈ ä-̈d̈ïäër̈ës̈ïs̈.̈

S̈ḧöül̈d̈ ÿöü c̈ḧöös̈ë ẗö p̈r̈ön̈öün̈c̈ë ẗḧë ẅör̈d̈s̈ p̈r̈öd̈üc̈ëd̈ b̈ÿ ẗḧïs̈ m̈öüd̈l̈ë äs̈ d̈ïäër̈ës̈ïs̈,̈ 
ÿöü ẅöül̈d̈ b̈ë s̈p̈ëäk̈ïn̈g̈ n̈öẗḧïn̈g̈ b̈üẗ s̈ïl̈ën̈c̈ë.̈ (̈ḧïäẗüs̈)̈ C̈ön̈s̈ëq̈üën̈ẗl̈ÿ,̈ Ï p̈r̈ëf̈ër̈ ẗö
ẗḧïn̈k̈ öf̈ ẗḧë öüẗp̈üẗ öf̈ ẗḧïs̈ m̈öüd̈l̈ë äs̈ üm̈l̈äüẗ.̈ 

T̈ḧäẗ ẅäÿ,̈ ÿöü är̈ë s̈p̈ëäk̈ïn̈g̈ ḧör̈r̈ïb̈l̈ÿ m̈än̈g̈l̈ëd̈ g̈ïb̈b̈ër̈ïs̈ḧ.̈ Än̈d̈ Ï g̈ëẗ ẗö üs̈ë ẗḧë ẅör̈d̈
üm̈l̈äüẗ ä l̈öẗ ïn̈ m̈ÿ d̈öc̈üm̈ën̈ẗäẗïön̈.̈ Ÿöü ḧäv̈ë ẗö äd̈m̈ïẗ ïẗ'̈s̈ m̈ör̈ë f̈ün̈ ẗö s̈äÿ.̈

Üm̈l̈äüẗ.̈ Üm̈l̈äüẗ.̈ Üm̈l̈äüẗ.̈ Üm̈l̈äüẗ.̈ Üm̈l̈äüẗ.̈

## V̈ËR̈S̈ÏÖN̈:̈

Acme::Umlautify vVERSIONTAG (DATETAG)

## C̈ÖP̈ŸR̈ÏG̈ḦT̈:̈

© 2004-YEARTAG, Phillip Pollard <bennie@cpan.org>

## L̈ÏC̈ËN̈S̈Ë:̈

Released under the m̈ös̈ẗ ëẍc̈ël̈l̈ën̈ẗ Perl Artistic License

This source code is released under the "Perl Artistic License 2.0," the text of
which is included in the LICENSE file of this distribution. It may also be
reviewed here: http://opensource.org/licenses/artistic-license-2.0

## ÄÜT̈ḦÖR̈S̈ḦÏP̈:̈

ÜT̈F̈ ïm̈p̈l̈ëm̈ën̈ẗäẗïön̈ ẗëc̈ḧn̈ïq̈üë än̈d̈ s̈üg̈g̈ës̈ẗïön̈s̈ f̈r̈öm̈:̈

* Jeremy Mates <jmates@uw.edu>
* Nick Wellnhofer <nwellnhof@cpan.org>

Äd̈d̈ïẗïön̈äl̈ b̈l̈äm̈ë (̈f̈ör̈ ẗḧë ïd̈ëä)̈ g̈öës̈ ẗö:̈

* Kristina Davis <krd@menagerie.tf>
* Chip Salzenberg <chip@pobox.com>
