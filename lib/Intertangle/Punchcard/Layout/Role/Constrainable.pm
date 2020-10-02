use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Layout::Role::Constrainable;
# ABSTRACT: A role to hold constraints for bounding boxes

use Mu;

has [ qw(top bottom left right) ] => ( is => 'ro' );

has [ qw(width height) ] => ( is => 'ro' );

1;
