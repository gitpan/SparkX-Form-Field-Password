package SparkX::Form::Field::Password;

our $VERSION = 0.1;

use Any::Moose;
with 'Spark::Form::Field';
with 'Spark::Form::Field::Role::MinLength';
with 'Spark::Form::Field::Role::Confirm';

has '+min_length' => (
    required => 0,
    default  => 6,
);

has '+errmsg_too_short' => (
    default  => sub {
        my $self = shift;
        "Your password must be at least " . 
        $self->min_length .
        " characters long."
    },
);

has '+errmsg_confirm' => (
    default  => "Your passwords must match!"
);

sub validate {
    my ($self) = @_;
    #This will be overridden by ::Role::MinLength if necessary.
    $self->valid(1);
}

1;
__END__

=head1 NAME

SparkX::Form::Field::Password - A password field for Spark::Form. Implements Spark::Form::Field::Role::MinLength

=head1 METHODS

=head2 validate ($value)

Verifies the password is at least 6 characters long

=head1 OPTIONS

=head2 min_length => Int

Supplies a minimum length for the password
Default = 6

=head2 errmsg_too_short => Str

Supplies a custom message when the password is too short.
Default = Your password must be at least $chars characters long.

=cut
