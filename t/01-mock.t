# Tests the email field
use Test::More tests => 8;
use Test::MockObject::Extends;
use SparkX::Form::Field::Password;
#Mock up a dumb form, a form only in name
my $dumb_form = Test::MockObject::Extends->new('Spark::Form');
#And a password that uses it
my $pass1 = SparkX::Form::Field::Password->new(
    value => 'test123',
    form  => $dumb_form,
    name  => 'password',
);
#Now a clever form, with a reference to the password
my $clever_form = Test::MockObject::Extends->new('Spark::Form');
$clever_form->mock('get',sub{$pass1});

my $pass2 = SparkX::Form::Field::Password->new(
    value   => 'test123',
    form    => $clever_form,
    name    => 'password',
    confirm => 'blah'
);

my $pass3 = SparkX::Form::Field::Password->new(
    value   => 'test1234',
    form    => $clever_form,
    name    => 'password',
    confirm => 'blah'
);

my $pass4 = SparkX::Form::Field::Password->new(
    value   => 'test',
    form    => $dumb_form,
    name    => 'password',
);

$pass1->validate;
$pass2->validate;
$pass3->validate;
$pass4->validate;


# 0 Tests
cmp_ok($pass1->valid,'==',1,'Valid password with no check is valid');
cmp_ok($pass2->valid,'==',1,'Valid password with check is valid');
cmp_ok($pass3->valid,'==',0,'Valid password not matching is invalid');
cmp_ok($pass4->valid,'==',0,'Invalid password not matching is invalid');
# 4 Tests
is_deeply($pass1->errors,[],"No errors on pass1");
is_deeply($pass2->errors,[],"No errors on pass2");
cmp_ok(scalar @{$pass3->errors},'==',1,'1 error for pass3');
cmp_ok(scalar @{$pass4->errors},'==',1,'1 error for pass4');
# 8 tests
