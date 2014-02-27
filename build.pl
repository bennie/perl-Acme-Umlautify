#!/usr/bin/env perl

require CPAN::Meta::YAML; # Do both YAML and JSON

use Data::Dumper;
use CPAN::Meta;
use strict;

### Config

my $module = 'Acme::Umlautify';

my $author  = 'Phil Pollard <bennie@cpan.org>';
my $license = 'artistic_2';

my $abstract    = 'ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!';
my $description = "A module that helps you ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!";

my $perl_ver = '5.006';

my %requires = ( 'perl' => $perl_ver, 'Test' => '0' );

### Post config

my $path_chunk = $module;
$path_chunk =~ s/::/-/g;

my $bug  = 'https://rt.cpan.org/Dist/Display.html?Name='.$path_chunk;
my $repo = 'http://github.com/bennie/perl-' . $path_chunk;
my $git  = 'git://github.com/bennie/perl-'.$path_chunk.'.git';

my $require_text = Dumper(\%requires);
$require_text =~ s/\$VAR1 = //;
$require_text =~ s/;$//;

### External grab

my $version = `./version.pl`;
my $date    = `date '+%Y/%m/%d'`;
my $year    = `date '+%Y'`;
my $distdir = $path_chunk .'-' . $version;

chomp $version;
chomp $date;
chomp $year;
chomp $distdir;

print "
Version : $version
Date    : $date
Year    : $year
Dist    : $distdir

";

### Write Makefile.PL

open MAKEFILE, '>', 'Makefile.PL';

print MAKEFILE "use ExtUtils::MakeMaker;

WriteMakefile(
  ABSTRACT => '$abstract',
  AUTHOR   => '$author',
  LICENSE  => '$license',
  NAME     => '$module',
  VERSION  => '$version',

  PREREQ_PM => $require_text,

  ( \$ExtUtils::MakeMaker::VERSION < 6.46
        ? ()
        : ( META_MERGE => {
                requires  => {perl => '$perl_ver'},
                resources => {
                    # homepage => 'http://FIXME.org',
                    # license  => 'http://dev.perl.org/licenses/',
                    # MailingList => 'http://FIXME',
                    repository => {
                        type => 'git',
                        url  => '$git',
                        web  => '$repo',
                    },
                    bugtracker => {
                        # mailto => '...',
                        web => '$bug',
                    },

                },
                no_index => {directory => [qw/t/]},
            },
            META_ADD => {
                build_requires     => {},
                configure_requires => {}
            },
        )
    )

);";

close MAKEFILE;

### Build the distribution directory

print `perl Makefile.PL`;
print `make distmeta`;

### Build META.json

unless ( -f $distdir.'/META.json' ) {
  my $distmeta = {

    # Required
    abstract => $abstract,
    author   => [ $author ],
    license  => [ $license ],
    name     => $path_chunk,
    version  => $version,

    # optional
    dynamic_config => 1,
    'meta-spec' => { version => '2', url => 'http://search.cpan.org/perldoc?CPAN::Meta::Spec' },
    generated_by => "CPAN::Meta version $CPAN::Meta::VERSION",

    # 2.0 only stuff
    description =>  $description,
    release_status => 'stable',

    prereqs => {
      runtime => {
        requires => \%requires,
        recommends => { },
      },
      build => {
        requires => \%requires,
      }
    },
    resources => {
      license    => [ 'http://dev.perl.org/licenses/' ],
      bugtracker => { web => $bug },
      repository => { web => $repo , type => 'git', url => $git },
    },
  };

  my $meta = CPAN::Meta->create($distmeta);
  print "Generating META.json on my own.\n";
  $meta->save($distdir.'/META.json');

  print "Adding META.json to the MANIFEST\n";
  open MANIFEST, '>>', $distdir.'/MANIFEST';
  print MANIFEST "META.json\nMakefile.PL";
  close MANIFEST;

}

### Updating the tags

print "\nUpdating DATETAG -> $date\n";
print `find $distdir -type f | xargs perl -p -i -e "s|DATETAG|$date|g"`;
print "Updating VERSIONTAG -> $version\n";
print `find $distdir -type f | xargs perl -p -i -e "s|VERSIONTAG|$version|g"`;
print "Updating YEARTAG -> $year\n";
print `find $distdir -type f | xargs perl -p -i -e "s|YEARTAG|$year|g"`;
print "\n";

### Build the tarball

unlink($distdir.'.tar') if -f $distdir.'.tar';
unlink($distdir.'.tar.gz') if -f $distdir.'.tar.gz';

print `tar cvf $distdir.tar $distdir && gzip --best $distdir.tar`;

### Cleanup

unlink('Makefile');
unlink('Makefile.old');
unlink('Makefile.PL');

print "\nDONE!\n";
