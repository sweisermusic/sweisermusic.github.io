#!/usr/bin/perl
#
# modperl wrapper for bogbrd.sh
#
	my $ACCT = "sweise02";
	my $SITE = "/h/$ACCT/public_html/bog15";
	my $PROG = "./bogbrd.sh";

	if ( !chdir($SITE) ){
		print "Content-type: text/plain\r\n\r\n";
		print "Cannot change directory to $SITE";
		exit(1);
	}
	if ( ! -x $PROG ){
		print "Content-type: text/plain\r\n\r\n";
		print "No boggle board generator";
		exit(1);
	}
	my $ARGS = "";

	if ( !defined( $ENV{'QUERY_STRING'} ) )
	{
		$ARGS = $ARGV[0];
	}
	else {
		$ARGS = $ENV{'QUERY_STRING'};
	}
	my $result = `$PROG $ARGS`;
	print $result;
