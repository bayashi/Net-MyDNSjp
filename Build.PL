use strict;
use warnings;
use Module::Build::Pluggable qw/CPANfile/;

my $builder = Module::Build::Pluggable->new(
    name                => 'Net-MyDNSjp',
    module_name         => 'Net::MyDNSjp',
    license             => 'artistic_2',
    dist_author         => 'Dai Okabayashi <bayashi@cpan.org>',
    dist_version_from   => 'lib/Net/MyDNSjp.pm',
    add_to_cleanup      => [ 'Net-MyDNSjp-*' ],
    no_index => {
        directory => [ 't', 'xt', 'inc' ],
    },
    meta_merge     => {
        resources => {
            repository  => 'http://github.com/bayashi/Net-MyDNSjp',
            bugtracker  => 'http://github.com/bayashi/Net-MyDNSjp/issues',
        }
    },
    recursive_test_files => 1,
    test_files => (-d '.git' || $ENV{RELEASE_TESTING}) ? ['t/', 'xt/'] : ['t/'],
    create_license => 1, # https://metacpan.org/pod/Software::License
);

$builder->create_build_script();
