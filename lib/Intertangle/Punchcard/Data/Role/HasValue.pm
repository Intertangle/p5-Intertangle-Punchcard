use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Data::Role::HasValue;
# ABSTRACT: A role for value-holding data

use Mu::Role;

requires 'value';

1;
