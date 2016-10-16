#!/usr/bin/perl -w
use strict;
use YAML qw( Dump );

my $hostname = shift || die "No hostname passed";

$hostname =~ /^(\w+)\.(\w+)\.(\w{3})$/
    or die "Invalid hostname: $hostname";

my ( $host, $domain, $net ) = ( $1, $2, $3 );

my @classes = ( 'base', $domain,  );
my %parameters = (
    puppetserver   => "puppet.$domain.$net"
    );

print Dump( {
    classes     => \@classes,
    parameters  => \%parameters,
} );
