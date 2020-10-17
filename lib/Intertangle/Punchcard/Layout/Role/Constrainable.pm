use Renard::Incunabula::Common::Setup;
package Intertangle::Punchcard::Layout::Role::Constrainable;
# ABSTRACT: A role to hold constraints for bounding boxes

use Mu;

=attr top bottom left right

...

=cut
has [ qw(top bottom left right) ] => ( is => 'ro' );

=attr width height

...

=cut
has [ qw(width height) ] => ( is => 'ro' );

1;
