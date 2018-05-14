XL-Whois
Description 	: Part of the XL-Toolkit, XL-Whois is a tool to gather whois
								information on domain names and IP addresses. It store the 
								responses into a database that can be used with other tools 
								of the XL-Toolkit.
Author 				: Alain Rioux (admin@le-tools.com)
WebSite				: http://le-tools.com/XL-Whois.html
SourceForge   : https://sourceforge.net/p/xl-whois
GitHub				: https://github.com/arioux/XL-Whois
Documentation	: http://le-tools.com/XL-WhoisDoc.html


Development
-----------

XL-Whois has been developped using ActivePerl 5.16.3 with the 
following modules installed:

- Encode (v2.56)
- Win32-API (v0.75)
- Win32-GUI (v1.08)
- Win32-Process (v0.16)
- threads (v1.96)
- threads-shared (v1.46)
- LWP (v6.05)
- ActiveState-DateTime
- HTTP-Date (v6.02)
- DBI (v1.631)
- Regexp-IPv6 (v0.03)
- Domain::PublicSuffix (v0.10)
- Net-Whois-IP (v1.21) - Modified
- Net-Whois-Raw (v2.91)
- Net-DNS (v1.02)
- Net-CIDR (v0.17)
- Net-IP-Lite (v0.03)
- NetAddr-IP (v4.078)
- JSON::Parse (v0.33)
- base (v2.15)
- HTTP-Message (v6.06)
- REST-Client (v273)
- XML-MyXML (v0.9007)


To do
-----



Packaging
---------

Executable has been packaged using PerlApp v.9.2.1 (ActiveState). For alternative to PerlApp, see 
http://www.nicholassolutions.com/tutorials/perl-PAR.htm.

Some additional modules may be required or manually added before packaging. Before packaging 
this tool, you will have to modify Net::DNS::Resolver:

Copy the code (# Modification) at the right place:

for ( $^O, 'UNIX' ) {
	my @parent = ( join '::', __PACKAGE__, $_ );
	@ISA = @parent if scalar eval "require @parent";
	
	# Start Modification: Added this code below
	/cygwin/ && do {
		if ( eval "require Net::DNS::Resolver::MSWin32;" ) {
			@ISA = qw(Net::DNS::Resolver::MSWin32);
			last;
		}
	};
	# End modification
	
	last if @ISA;
}

You also have to modify Net-Whois-IP. Modify the code (# Modification) at the right place:

	# It allows to set the first registry to query
    if(($ip !~ /\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}/)  &&  ($ip !~ /^$IPv6_re$/) && ($ip !~ /^NET6/)) {   <-- Here
				croak("$ip is not a valid ip address");
    }
...
LOOP:while(1) {    
      $i++;
      my $sock = _get_connect($registrar);
      # Replaced by: if ARIN add n param, if RIPE or Afrinic add -B param
      if    ($registrar eq 'whois.arin.net') {
				if ($ip =~ /^NET6/) {    <-- Here
						print $sock "n ! $ip\n";
				} else {
						print $sock "n $ip\n";
				}
      } elsif ($registrar eq 'whois.ripe.net' or $registrar eq "whois.afrinic.net") { 
          print $sock "-B $ip\n"; 
      } else  { 
          print $sock "$ip\n";    
      }

