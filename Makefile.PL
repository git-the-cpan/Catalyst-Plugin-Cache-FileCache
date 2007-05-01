use strict;
use warnings;
use inc::Module::Install 0.65;

name 'Catalyst-Plugin-Cache-FileCache';
all_from 'lib/Catalyst/Plugin/Cache/FileCache.pm';

requires 'Catalyst::Runtime' => '5.7006';
requires 'Cache::FileCache';

auto_install;
WriteAll;
