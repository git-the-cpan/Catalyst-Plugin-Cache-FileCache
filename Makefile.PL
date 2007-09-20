use strict;
use warnings;

use inc::Module::Install 0.67;

name 'Catalyst-Plugin-Cache-FileCache';
all_from 'lib/Catalyst/Plugin/Cache/FileCache.pm';

requires 'Catalyst::Runtime' => '5.7006';
requires 'Cache::FileCache';
requires 'Class::Data::Inheritable';

auto_install;
WriteAll;
