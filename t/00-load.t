#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'SparkX::Form::Field::Password' );
}

diag( "Testing SparkX::Form::Field::Password $SparkX::Form::Field::Password::VERSION, Perl $], $^X" );
