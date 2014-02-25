#!/usr/bin/env perl

use CPAN::Meta;
use strict;

my $version = `./version.pl`;
my $build   = `./version.pl --build`;
my $date    = `date '+%Y/%m/%d'`;
my $year    = `date '+%Y'`;
my $tardir  = "Acme-Umlautify-$version";

chomp $version;
chomp $build;
chomp $date;
chomp $year;
chomp $tardir;

print "
Version : $version
Build   : $build
Date    : $date
Year    : $year
Tar Dir : $tardir
";

### Build the Meta data

my $distmeta = {
    name => 'Acme-Umlautify',
    abstract => 'ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!',
    description =>  "A module that helps you ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!",
    version  => $version,
    release_status => 'stable',
    author   => [
      'Phil Pollard <bennie@cpan.org>'
    ],
    license  => [ 'artistic_2' ],
    prereqs => {
      runtime => {
        requires => {
          'perl'   => '5.006',
        },
        recommends => {
        },
      },
      build => {
        requires => {
          'Test' => '0',
        },
      }
    },
    resources => {
      license    => ['http://dev.perl.org/licenses/'],
      bugtracker => { web => 'https://rt.cpan.org/Dist/Display.html?Name=Acme-Umlautify' },
      repository => { web => 'http://github.com/bennie/perl-Acme-Umlautify', type => 'git', url => 'git://github.com/bennie/perl-Acme-Umlautify.git' },
    },
    #optional_features => {
    #  domination => {
    #    description => 'Take over the world',
    #    prereqs     => {
    #      develop => { requires => { 'Genius::Evil'     => '1.234' } },
    #      runtime => { requires => { 'Machine::Weather' => '2.0'   } },
    #    },
    #  },
    #},
    dynamic_config => 1,
    #keywords => [ qw/ toolchain cpan dual-life / ],
  };

my $meta = CPAN::Meta->create($distmeta);

$meta->save('META.json');

### Build the distribution

if ( -d 'build' ) {
  print "Cleaning the build directory:\n";
  print `rm -rfv build`;
  print "\n";
}

print "Creating the build directory:\n";
print `mkdir -pv "build/$tardir"`;
print "\n";

print "Copying files:\n";
print `rsync -av --files-from=MANIFEST ./ "build/$tardir/"`;
print "\n";


print "Updating date tags:\n";
print `find build -type f xargs perl -p -i -e "s|DATETAG|$date|g"`;
print "\n";

print "Updating version tags:\n";
print `find build -type f | xargs perl -p -i -e "s|VERSIONTAG|$version|g"`;
print "\n";

print "Updating build tags:\n";
print `find build -type f | xargs perl -p -i -e "s|BUILDTAG|$build|g"`;
print "\n";

print "Updating date tags\n";
print `find build -type f | xargs perl -p -i -e "s|YEARTAG|$year|g"`;
print "\n";

print "Building the tar file:\n";
print `cd build && tar czvf $tardir.tar.gz $tardir`;
print "\n";

print `rm -v META.json`;

print "DONE!\n";
