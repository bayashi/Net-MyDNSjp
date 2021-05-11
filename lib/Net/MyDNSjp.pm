package Net::MyDNSjp;
use strict;
use warnings;
use Carp qw/croak/;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $args  = shift || +{};

    bless $args, $class;
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
