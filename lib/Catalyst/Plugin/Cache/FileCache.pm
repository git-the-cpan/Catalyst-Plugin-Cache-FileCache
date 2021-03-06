package Catalyst::Plugin::Cache::FileCache;

use strict;
use base 'Class::Data::Inheritable';

our $VERSION = '0.7';

use Cache::FileCache;

__PACKAGE__->mk_classdata('cache');

sub setup {
    my $self = shift;

    my $params = {};

    if ( $self->config->{cache} ) {
        $params = { %{ $self->config->{cache} } };
    }

    if ( $params->{storage} ) {
        $params->{cache_root} = delete $params->{storage};
    }

    if ( $params->{expires} ) {
        $params->{default_expires_in} = delete $params->{expires};
    }

    $self->cache( Cache::FileCache->new($params) );

    return $self->NEXT::setup(@_);
}

1;


__END__

=head1 NAME

Catalyst::Plugin::Cache::FileCache - (DEPRECATED) File cache

=head1 SYNOPSIS

    use Catalyst qw[Cache::FileCache];

    MyApp->config->{cache}->{storage} = '/tmp';
    MyApp->config->{cache}->{expires} = 3600;

    my $data;

    unless ( $data = $c->cache->get('data') ) {
        $data = MyApp::Model::Data->retrieve('data');
        $c->cache->set( 'data', $data );
    }

    $c->response->body($data);

=head1 DEPRECATION NOTICE

This module has been deprecated in favor of L<Catalyst::Plugin::Cache>.
You can configure that module to use a FileCache backend.

=head1 DESCRIPTION

Extends base class with a file cache.

=head1 METHODS

=head2 setup

=head2 cache

Returns an instance of C<Cache::FileCache>

=head1 SEE ALSO

L<Catalyst::Plugin::Cache>, L<Cache::FileCache>, L<Catalyst>.

=head1 AUTHOR

Christian Hansen, C<ch@ngmedia.com>
Sebastian Riedel C<sri@oook.de>

=head1 LICENSE

This library is free software . You can redistribute it and/or modify it under
the same terms as perl itself.

=cut
