use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Backend::Kiwisolver::Symbolic;
# ABSTRACT: Kiwisolver variable

use Mu;
use Graphics::Layout::Kiwisolver;
use Renard::Incunabula::Common::Types qw(InstanceOf);
use overload nomethod => \&_delegate_op;

=attr name

Name for variable.

=method C<has_name>

Predicate for C<name>.

=cut
has name => ( is => 'ro', predicate => 1 );

has _delegate => (
	is => 'ro',
	isa => (
		InstanceOf['Graphics::Layout::Kiwisolver::Variable']
		| InstanceOf['Graphics::Layout::Kiwisolver::Term']
		| InstanceOf['Graphics::Layout::Kiwisolver::Expression']
		| InstanceOf['Graphics::Layout::Kiwisolver::Constraint']
		),
	default => method() {
		Graphics::Layout::Kiwisolver::Variable->new;
	},
);

=method BUILD

=cut
method BUILD() {
	if( $self->has_name ) {
		$self->_delegate->setName( $self->name );
	}
}

method _delegate_op($other, $inv, $meth) {
	my $op = overload::Method($self->_delegate, $meth);
	die "Operator $meth not available" unless defined $op;
	my $return =  $op->($self->_delegate, defined $other && ref $other ? $other->_delegate : $other , $inv );

	if( $meth eq '""') {
		return $return;
	}

	my $return_wrapper;
	$return_wrapper = Intertangle::Punchcard::Backend::Kiwisolver::Symbolic->new(
		_delegate => $return,
	);

	$return_wrapper;
}

=method value

Set or get value for variable.

=cut
method value($value = undef) {
	if( defined $value ) {
		$self->_delegate->setValue( $value );
	} else {
		$self->_delegate->value;
	}
}

with qw(Intertangle::Punchcard::Data::Role::Variable);

1;
