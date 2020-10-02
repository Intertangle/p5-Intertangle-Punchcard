use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Backend::Kiwisolver::Context;
# ABSTRACT: Context for Kiwisolver backend

use Mu;
use Intertangle::Punchcard::Backend::Kiwisolver::Solver;
use Intertangle::Punchcard::Backend::Kiwisolver::Symbolic;

lazy solver => sub {
	Intertangle::Punchcard::Backend::Kiwisolver::Solver->new
};

method new_variable(@args) {
	Intertangle::Punchcard::Backend::Kiwisolver::Symbolic->new( @args );
}

1;
