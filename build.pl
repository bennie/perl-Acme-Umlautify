#!/usr/bin/env perl

require CPAN::Meta::YAML; # Do both YAML and JSON

use CPAN::Meta;
use strict;

### Config

my $module = 'Acme::Umlautify';

my $author  = 'Phil Pollard <bennie@cpan.org>';
my $license = 'artistic_2';

my $abstract    = 'ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!';
my $description = "A module that helps you ƒdd ¸ml‰¸ts tˆ ÎvÎrˇthÔng!";

my $perl_ver = '5.006';

my %requires = ( 'Test' => '0' );
my %build    = ( 'Test' => '0' );

### Post config

my $path_chunk = $module;
$module =~ s/::/-/g;

### External grab

my $version = `./version.pl`;
my $build   = `./version.pl --build`;
my $date    = `date '+%Y/%m/%d'`;
my $year    = `date '+%Y'`;
my $tardir  = $path_chunk . '-' . $version;

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

    # Required
    abstract => $abstract,
    author   => [ $author  ],
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
        requires => { 'perl' => $perl_ver },
        recommends => { },
      },
      build => {
        requires => \%requires,
      }
    },
    resources => {
      license    => [ 'http://dev.perl.org/licenses/' ],
      bugtracker => { web => 'https://rt.cpan.org/Dist/Display.html?Name='.$path_chunk },
      repository => { web => 'http://github.com/bennie/perl-' . $path_chunk , type => 'git', url => 'git://github.com/bennie/perl-'.$path_chunk.'.git' },
    },
};

my $meta = CPAN::Meta->create($distmeta);
$meta->save('META.json');

$distmeta = {

    # Required
    abstract => $abstract,
    author   => [ $author  ],
    license  => $license,
    name     => $path_chunk,
    version  => $version,

    # optional
    dynamic_config => 1,
    generated_by => "CPAN::Meta version $CPAN::Meta::VERSION",
    'meta-spec' => { version => '1.4', url => 'http://module-build.sourceforge.net/META-spec-v1.4.html' },

    requires => { 'perl' => $perl_ver, %requires },
    build_requires => \%build,

};

my $yaml = CPAN::Meta->create($distmeta);
$yaml->save('META.yml');

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

print "Updating date tags: DATETAG -> $date\n";
print `find build -type f xargs perl -p -i -e "s|DATETAG|$date|g"`;
print "Updating version tags: VERSIONTAG -> $version\n";
print `find build -type f | xargs perl -p -i -e "s|VERSIONTAG|$version|g"`;
print "Updating build tags: BUILDTAG -> $build\n";
print `find build -type f | xargs perl -p -i -e "s|BUILDTAG|$build|g"`;
print "Updating year tags: YEARTAG -> $year\n";
print `find build -type f | xargs perl -p -i -e "s|YEARTAG|$year|g"`;
print "\n";

print "Building the tar file:\n";
print `cd build && tar czvf $tardir.tar.gz $tardir`;
print "\n";

print "Removing local META files:\n";
print `rm -v META.json META.yml`;
print "\n";

print "DONE!\n";
