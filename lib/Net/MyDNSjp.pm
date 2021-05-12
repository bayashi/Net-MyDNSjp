package Net::MyDNSjp;
use strict;
use warnings;
use Carp qw/croak/;
use HTTP::Tiny;
use MIME::Base64 qw/encode_base64/;
use Class::Accessor::Lite (
    ro => [qw/
        id
        password
        dns_txt_url
        update_ip_url
        client
    /],
);

our $VERSION = '0.01';

sub certbot_env_list {
    return('CERTBOT_DOMAIN','CERTBOT_VALIDATION','CERTBOT_TOKEN','CERTBOT_CERT_PATH','CERTBOT_KEY_PATH','CERTBOT_SNI_DOMAIN','CERTBOT_AUTH_OUTPUT');
}

sub build_url {
    my ($self, $is_dns_txt_url) = @_;

    sprintf(
        $is_dns_txt_url ? $self->dns_txt_url : $self->update_ip_url,
        $self->id,
        $self->password,
    );
}

sub new {
    my $class = shift;
    my %args  = @_;

    $args{id} or croak 'require id';
    $args{password} or croak 'require password';

    bless {
        client => HTTP::Tiny->new(agent => __PACKAGE__ . "/$VERSION"),
        dns_txt_url => 'https://%s:%s@www.mydns.jp/directedit.html',
        update_ip_url => 'https://%s:%s@www.mydns.jp/login.html',
        %args,
    }, $class;
}

sub notify_ip {
    my ($self) = @_;

    my $res = $self->client->get($self->build_url);

    $res->{success} or croak $res->content;
}

sub register_dns_txt {
    my ($self) = @_;

    $self->_dns_txt('REGIST');
}

sub register_dns_txt {
    my ($self) = @_;

    $self->_dns_txt('DELETE');
}

sub _dns_txt {
    my ($self, $command) = @_;

    my $certbot_params;
    for my $k ($self->certbot_env_list) {
        $certbot_params->{$k} = exists $ENV{$k} ? $ENV{$k} : '';
    }

    $certbot_params->{EDIT_CMD} = $command;

    my $res = $self->client->post_form(
        $self->build_url,
        $certbot_params,
    );

    $res->{success} or croak $res->content;
}

1;

__END__

=encoding UTF-8

=head1 NAME

Net::MyDNSjp - one line description


=head1 SYNOPSIS

    use Net::MyDNSjp;


=head1 DESCRIPTION

Net::MyDNSjp is


=head1 REPOSITORY

=begin html

<a href="https://github.com/bayashi/Net-MyDNSjp/blob/master/README.pod"><img src="https://img.shields.io/badge/Version-0.01-green?style=flat"></a> <a href="https://github.com/bayashi/Net-MyDNSjp/blob/master/LICENSE"><img src="https://img.shields.io/badge/LICENSE-Artistic%202.0-GREEN.png"></a> <a href="https://github.com/bayashi/Net-MyDNSjp/actions"><img src="https://github.com/bayashi/Net-MyDNSjp/workflows/master/badge.svg"/></a> <a href="https://coveralls.io/r/bayashi/Net-MyDNSjp"><img src="https://coveralls.io/repos/bayashi/Net-MyDNSjp/badge.png?branch=master"/></a>

=end html

Net::MyDNSjp is hosted on github: L<http://github.com/bayashi/Net-MyDNSjp>

I appreciate any feedback :D


=head1 AUTHOR

Dai Okabayashi E<lt>bayashi@cpan.orgE<gt>


=head1 SEE ALSO

L<Other::Module>


=head1 LICENSE

C<Net::MyDNSjp> is free software; you can redistribute it and/or modify it under the terms of the Artistic License 2.0. (Note that, unlike the Artistic License 1.0, version 2.0 is GPL compatible by itself, hence there is no benefit to having an Artistic 2.0 / GPL disjunction.) See the file LICENSE for details.

=cut
