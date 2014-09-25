#!/usr/bin/perl
#
# wrapper for bogcheck
#
#   this has to be customized for the user account
#   by putting the actual site dir in the script
#
#   assumes: 	This script expects to get the seed and board size
#		passed to it in QUERY_STRING, eg  1234n
#
#		And expects a list of words on stdin using post
#		copy them to a temp file
#		then run the checker 
#
#   hist: 2013-11-24
#

	my $ACCT = "sweise02";
	my $SITE = "/h/$ACCT/public_html/bog15";

	if ( !chdir( $SITE ) ){
		print "Content-type: text/plain\r\n\r\n";
		print "Cannot change directory to $SITE";
		exit(1);
	}

	my $qs = $ENV{'QUERY_STRING'};
	if ( $qs !~ /^\d+[a-z]$/ ){
		print "Content-type: text/plain\r\n\r\n";
		print "Query string $qs is not of correct form";
		exit(1);
	}

	my @words = <STDIN>;
	my $tf = `mktemp /tmp/bb.$ACCT.XXXXXX`;
	chomp $tf;
	open(F, ">$tf");
	print F @words;
	close(F);
	
	my $result = `./bogcheck.sh $qs < $tf`;
	unlink($tf);
	print $result;
