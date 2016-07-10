package MyApp;
use Mojo::Base 'Mojolicious';
use Mojolicious::Plugin::AccessLog;

# This method will run once at server start
sub startup {
  my $self = shift;

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  # Logging
  # $self->log( Mojo::Log->new( path => '/var/log/docker/app.log', level => 'debug' ) );
  $self->plugin(AccessLog => {log => '/var/log/docker/access.log'});
  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('example#welcome');
}

1;
