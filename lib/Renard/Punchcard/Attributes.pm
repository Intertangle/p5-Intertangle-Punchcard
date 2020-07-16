use Renard::Incunabula::Common::Setup;
package Renard::Punchcard::Attributes;
# ABSTRACT: «TODO»

use Moo::_Utils;

sub import {
	my $target = caller;
	my $has    = $target->can( "has" ) or die "Moo not loaded in caller: $target";
        _install_coderef $target. "::variable" => my $variable = sub {
		my ($name, @args) = @_;
		$has->($name,
			is => 'lazy',
			builder => sub {
				Renard::Punchcard::Backend::Kiwisolver::Symbolic->new( name => $name );
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
