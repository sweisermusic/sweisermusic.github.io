#!/usr/bin/perl
#
# modperl tool to get a file.  Query string is name of file
#

	my $ACCT = "sweise02";
	my $SITE = "/h/$ACCT/public_html/bog15";

	if ( !chdir($SITE) ){
		print "Content-type: text/plain\r\n\r\n";
		print "Cannot change directory to $SITE";
		exit(0);
	}

	my $QS = $ENV{'QUERY_STRING'};
	$QS =~ s/\///g;
	my ($name,$type) = split( /\./, $QS );

	if ( $type eq "js" ){
		$type = "javascript";
	}
	elsif ( $type eq "txt" ){
		$type = "plain";
	}

	if ( -f $QS ){
		print "Content-type: text/$type\r\n\r\n";
		$F=`cat $QS`;
		print $F;
	}
