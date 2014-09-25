#!/usr/bin/perl
#
# bogsolve.cgi -- return the result of solving a board
#
# modperl wrapper for bogsolve.sh
#
	my $ACCT = "sweise02";
	my $SITE = "/h/$ACCT/public_html/bog15";
	my $PROG = "./bogsolve.sh";

	if ( !chdir($SITE) ){
		print "Content-type: text/plain\r\n\r\n";
		print "Cannot change directory to $SITE";
		exit(0);
	}
	if ( ! -x $PROG ){
		print "Content-type: text/plain\r\n\r\n";
		print "No boggle board solver";
		exit(0);
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
