# Pragmas.
use strict;
use warnings;

# Modules.
use inc::Module::Install;

# Definition.
abstract 'Script to generate video.';
author 'Michal Spacek <skim@cpan.org>';
install_script 'bin/video-generator';
license 'bsd';
name 'App-Video-Generator';
readme_from 'bin/video-generator';
requires 'English' => 0;
requires 'Error::Pure' => 0.16;
requires 'Getopt::Std' => 0;
requires 'Video::Generator' => 0.04;
requires 'perl' => '5.6.0';
resources 'bugtracker' => 'https://rt.cpan.org/Public/Dist/Display.html'.
	'?Name=App-Video-Generator';
resources 'homepage' => 'https://github.com/tupinek/App-Video-Generator';
resources 'repository' => 'git://github.com/tupinek/App-Video-Generator';
test_requires 'English' => 0;
test_requires 'Error::Pure::Utils' => 0.16;
test_requires 'File::Object' => 0.05;
test_requires 'Test::More' => 0;
test_requires 'Test::NoWarnings' => 0;
test_requires 'Test::Pod' => 0;
test_requires 'Test::Pod::Coverage' => 0;
tests_recursive;
version '0.03';

# Run.
WriteAll();
