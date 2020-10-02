use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Attributes;
# ABSTRACT: «TODO»

use Moo::_Utils qw(_install_coderef);
use Intertangle::Punchcard::Backend::Kiwisolver::Symbolic;

sub import {
	my $target = caller;
	my $has    = $target->can( "has" ) or die "Moo not loaded in caller: $target";
        _install_coderef $target. "::variable" => my $variable = sub {
		my ($name, @args) = @_;
		$has->($name,
			is => 'lazy',
			builder => sub {
				Intertangle::Punchcard::Backend::Kiwisolver::Symbolic->new( name => $name );
			},
			@args,
		);
        };

	if (my $info = $Role::Tiny::INFO{$target}) {
		$info->{not_methods}{$variable} = $variable;
	}

	undef;
}

1;
