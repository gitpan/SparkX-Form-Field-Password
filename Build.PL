use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'SparkX::Form::Field::Password',
    license             => 'perl',
    dist_author         => 'James Laver <sprintf qw(%s@%s.%s cpan jameslaver com)>',
    dist_version_from   => 'lib/SparkX/Form/Field/Password.pm',
    build_requires => {
        'Test::More'        => 0,
    },
    requires       => {
        'Spark::Form'       => ">=0.01",
        'Any::Moose'        => 0,
    },
    add_to_cleanup      => [ 'Spark-*' ],
    create_makefile_pl => 'traditional',
);

$builder->create_build_script();
