use Renard::Incunabula::Common::Setup;
package Renard::Punchcard::Layout::Role::Constrainable;
# ABSTRACT: A role to hold constraints for bounding boxes

use Mu;

has [ qw(top bottom left right) ] => ();

has [ qw(width height) ] => ();

1;

