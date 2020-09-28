use Renard::Incunabula::Common::Setup;
package Renard::Punchcard::Backend::Kiwisolver::Context;
# ABSTRACT: Context for Kiwisolver backend

use Mu;
use Renard::Punchcard::Backend::Kiwisolver::Solver;
use Renard::Punchcard::Backend::Kiwisolver::Symbolic;

lazy solver => sub {
	Renard::Punchcard::Backend::Kiwisolver::Solver->new
};

method new_variable(@args) {
	Renard::Punchcard::Backend::Kiwisolver::Symbolic->new( @args );
}

1;
