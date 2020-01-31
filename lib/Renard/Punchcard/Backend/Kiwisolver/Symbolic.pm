use Renard::Incunabula::Common::Setup;
package Renard::Punchcard::Backend::Kiwisolver::Symbolic;
# ABSTRACT: Kiwisovler variable

use Mu;
use Renard::API::Kiwisolver;
use Renard::Incunabula::Common::Types qw(InstanceOf);
use overload nomethod => \&_delegate_op;

has name => ( is => 'ro', predicate => 1 );

has _delegate => (
	is => 'ro',
	isa => (
		InstanceOf['Renard::API::Kiwisolver::Variable']
		| InstanceOf['Renard::API::Kiwisolver::Term']
		| InstanceOf['Renard::API::Kiwisolver::Expression']
		| InstanceOf['Renard::API::Kiwisolver::Constraint']
		),
	handles => [ qw(value) ],
	default => method() {
		Renard::API::Kiwisolver::Variable->new;
	},
);

method BUILD() {
	if( $self->has_name ) {
		$self->_delegate->setName( $self->name );
	}
}

method _delegate_op($other, $inv, $meth) {
	my $op = overload::Method($self->_delegate, $meth);
	die "Operator $meth not available" unless defined $op;
	my $return =  $op->($self->_delegate, defined $other && ref $other ? $other->_delegate : $other , $inv );

	my $return_wrapper;
	$return_wrapper = Renard::Punchcard::Backend::Kiwisolver::Symbolic->new(
		_delegate => $return,
	);

	$return_wrapper;
}

with qw(Renard::Punchcard::Data::Role::Variable);

1;
