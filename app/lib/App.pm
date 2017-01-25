package App;
use Mojo::Base 'Mojolicious';

sub startup {
  my $self = shift;
  # Router
  my $r = $self->routes;
  # Normal route to controller
  $r->get('/')->to('example#welcome');
}
1;