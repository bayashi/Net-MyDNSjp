# http://bit.ly/cpanfile
# http://bit.ly/cpanfile_version_formats
requires 'perl', '5.008005';
requires 'strict';
requires 'warnings';
requires 'Carp';
requires 'HTTP::Tiny';
requires 'Net::SSLeay';
requires 'IO::Socket::SSL';
requires 'MIME::Base64';
requires 'Class::Accessor::Lite';

on 'test' => sub {
    requires 'Test::More', '0.88';
};

on 'configure' => sub {
    requires 'Module::Build' , '0.40';
    requires 'Module::Build::Pluggable';
    requires 'Module::Build::Pluggable::CPANfile';
};

on 'develop' => sub {
    requires 'Software::License';
    requires 'Test::Perl::Critic';
    requires 'Test::Pod::Coverage';
    requires 'Test::Pod';
    requires 'Test::NoTabs';
    requires 'Test::Perl::Metrics::Lite';
    requires 'Test::Vars';
    requires 'File::Find::Rule::ConflictMarker';
    requires 'File::Find::Rule::BOM';
};
