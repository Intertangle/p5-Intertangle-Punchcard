use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Backend::Kiwisolver::Solver;
# ABSTRACT: Solver wrapper for Kiwisolver

use Mu;
use Intertangle::API::Kiwisolver;
use Renard::Incunabula::Common::Types qw(InstanceOf);

has _delegate => (
	is => 'ro',
	isa => InstanceOf['Intertangle::API::Kiwisolver::Solver'],
	default => method() {
		Intertangle::API::Kiwisolver::Solver->new;
	},
);

method add_constraint($constraint) {
	$self->_delegate->addConstraint($constraint->_delegate);
}

method update() {
	$self->_delegate->updateVariables;
}

method add_edit_variable($variable, $strength) {
	$self->_delegate->addEditVariable($variable->_delegate, $strength);
}

method suggest_value($variable, $value) {
	$self->_delegate->suggestValue($variable->_delegate, $value);
}

1;
