XL-Whois
Description 	: Part of the XL-Toolkit, XL-Whois is a tool to gather whois
								information on domain names and IP addresses. It store the 
								responses into a database that can be used with other tools 
								of the XL-Toolkit.
Author 				: Alain Rioux (admin@le-tools.com)
WebSite				: http://le-tools.com/XL-Whois.html
GitHub				: https://github.com/arioux/XL-Whois
Documentation	: http://le-tools.com/XL-WhoisDoc.html
CodePlex			: https://xlwhois.codeplex.com/


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
- Net-Whois-IP (v1.18)
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

- Option to choose the ISP Name (auto parsing doesn't always give the best result)


Packaging
---------

Executable has been packaged using PerlApp v.9.2.1 (ActiveState). For 
alternative to PerlApp, see 
http://www.nicholassolutions.com/tutorials/perl-PAR.htm.

Some additional modules may be required or manually added before 
packaging. Before packaging this tool, you will have to modify 
Net::DNS::Resolver:

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



