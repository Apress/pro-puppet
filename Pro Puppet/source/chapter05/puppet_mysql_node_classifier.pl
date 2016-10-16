#!/usr/bin/perl -w
use strict;
use YAML qw( Dump );
use DBI;

my $hostname = shift || die "No hostname passed";

$hostname =~ /^(\w+)\.(\w+)\.(\w{3})$/
    or die "Invalid hostname: $hostname";

my ( $host, $domain, $net ) = ( $1, $2, $3 );

# MySQL Configuration
my $data_source = "dbi:mysql:database=puppet;host=localhost";
my $username = "puppet";
my $password = "password";

# Connect to the server
my $dbh = DBI->connect($data_source, $username, $password)
    or die $DBI::errstr;

# Build the query
my $sth = $dbh->prepare( qq{SELECT class FROM nodes WHERE node = '$hostname'})
    or die "Can't prepare statement: $DBI::errstr";

# Execute the query
my $rc = $sth->execute
    or die "Can't execute statement: $DBI::errstr";

# Set parameters
my %parameters = (
    puppet_server   => "puppet.$domain.$net"
    );

# Set classes
my @class;
while (my @row=$sth->fetchrow_array)
 { push(@class,@row) }

# Check for problems
die $sth->errstr if $sth->err;

# Disconnect from database
$dbh->disconnect;

# Print the YAML
print Dump( {
    classes     => \@class,
    parameters  => \%parameters,
} );
