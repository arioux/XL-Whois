#!/usr/bin/perl
# Perl - v: 5.16.3
#------------------------------------------------------------------------------#
# XL-WhoisLang.pl : Strings for XL-Whois
# WebSite         : http://le-tools.com/XL-Whois.html
# Documentation   : http://le-tools.com/XL-WhoisDoc.html
# SourceForge     : https://sourceforge.net/p/xl-whois
# GitHub          : https://github.com/arioux/XL-Whois
# Creation        : 2015-09-30
# Modified        : 2019-06-09
# Author          : Alain Rioux (admin@le-tools.com)
#
# Copyright (C) 2015-2019  Alain Rioux (le-tools.com)
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#------------------------------------------------------------------------------#
# Modules
#------------------------------------------------------------------------------#
use strict;
use warnings;

#------------------------------------------------------------------------------#
sub loadStr
#------------------------------------------------------------------------------#
{
  # Local variables
  my ($refSTR, $LANG_FILE) = @_;
  # Open and load string values
  open(LANG, "<:encoding(UTF-8)", $LANG_FILE);
  my @tab = <LANG>;
  close(LANG);
  # Store values  
  foreach (@tab) {
    chomp($_);
    s/[^\w\=\s\.\!\,\-\)\(\']//g;
    my ($key, $value) = split(/ = /, $_);
    $value = encode("iso-8859-1", $value); # Revaluate with different language encoding
    if ($key) { $$refSTR{$key}  = $value; }
  }
  
}  #--- End loadStr

#------------------------------------------------------------------------------#
sub loadDefaultStr
#------------------------------------------------------------------------------#
{
  # Set default strings
  my $refSTR = shift;
  # General strings
  $$refSTR{'Cancel'}            = 'Cancel';
  $$refSTR{'Error'}             = 'Error';
  $$refSTR{'Add'}               = 'Add';
  $$refSTR{'Edit'}              = 'Edit';
  $$refSTR{'Save'}              = 'Save';
  $$refSTR{'Download'}          = 'Download';
  $$refSTR{'Select'}            = 'Select';
  $$refSTR{'Update'}            = 'Update';
  $$refSTR{'Show'}              = 'Show';
  $$refSTR{'Search'}            = 'Search';
  $$refSTR{'Get'}               = 'Get';
  $$refSTR{'OK'}                = 'OK';
  $$refSTR{'Exporting'}         = 'Exporting';
  $$refSTR{'Analysing'}         = 'Analysing';
  $$refSTR{'Cancelling'}        = 'Cancelling...';
  $$refSTR{'Searching'}         = 'Searching';
  $$refSTR{'Connecting'}        = 'Connecting to';
  $$refSTR{'Refresh'}           = 'Refresh selected ISP';
  $$refSTR{'database'}          = 'database';
  $$refSTR{'file'}              = 'file';
  $$refSTR{'report'}            = 'report';
  $$refSTR{'language'}          = 'language';
  $$refSTR{'ISP'}               = 'ISP';
  $$refSTR{'item'}              = 'Item';
  $$refSTR{'Whois'}             = 'Whois';
  $$refSTR{'WhoisComment'}      = 'Whois with comment...';
  $$refSTR{'Help'}              = 'Help';
  $$refSTR{'Quit'}              = 'Quit';
  $$refSTR{'errCreating'}       = 'Error creating';
  $$refSTR{'errReading'}        = 'Error reading file: ';
  $$refSTR{'errWriting'}        = 'Error writing';
  $$refSTR{'errDownloading'}    = 'Error downloading';
  $$refSTR{'errNoDB'}           = 'No database file. You can select or create one in Settings.';
  $$refSTR{'errorMsg'}          = 'Error messsage';
  $$refSTR{'errConnection'}     = 'Error Connection';
  $$refSTR{'errUnknown'}        = 'Unknown error';
  $$refSTR{'errConnectingDB'}   = 'Error connecting database: ';
  $$refSTR{'errLoadingDB'}      = 'Error loading database.';
  $$refSTR{'errUpdatingDB'}     = 'Error updating database: ';
  $$refSTR{'errNoValidFile'}    = 'File does not seem valid.';
  $$refSTR{'errFileEmpty'}      = 'File seems empty.';
  $$refSTR{'newLineGrid'}       = ' new line in grid.';
  $$refSTR{'errProcessRun'}     = 'A process is already running. Wait until it stops or restart the program.';
  $$refSTR{'errResolver'}       = 'Unable to resolve domain name or IP address.';
  $$refSTR{'errGeoIPResolve'}   = 'Unable to open GeoIP2 resolver.';
  $$refSTR{'errViewingReport'}  = 'Error viewing report: ';
  $$refSTR{'errTableWhoisDB'}   = 'Whois Database is not valid: No Whois table found.';
  $$refSTR{'errTableLoggingDB'} = 'Logging Database is not valid: No Logging table found.';
  $$refSTR{'selectValidFile'}   = 'You must select a valid file.';
  $$refSTR{'dbCreated'}         = 'The database has been created.';
  $$refSTR{'exportSuccess'}     = 'Exporting successfull';
  $$refSTR{'readyParserOpt'}    = 'Select a object to parse (IPv4, IPv6, Hostname, Domain name)';
  $$refSTR{'readySelWhoisOpt'}  = 'Select a whois option (Domain, Network, DNS)';
  $$refSTR{'readySelWhoisDB'}   = 'Select the Whois Database location or create a new one';
  $$refSTR{'readySelLoggingDB'} = 'Select the Logging Database location or desactivate logging';
  $$refSTR{'readySelTLDDB'}     = 'Select the TLD Database location or download it';
  $$refSTR{'readySelWSDB'}      = 'Select the Whois Server Database location or download it';
  $$refSTR{'whoisProgress'}     = 'Whois in progress...';
  $$refSTR{'wasFoundWhoisDB'}   = 'was found in the Whois Database';
  $$refSTR{'wasFoundLoggingDB'} = 'was found in the Logging Database';
  $$refSTR{'more3entries'}      = 'There are more than 3 entries found for';
  $$refSTR{'inLoggingDBLast3'}  = 'in Logging Database. Last 3 entries';
  $$refSTR{'sendQueryAnyway'}   = 'Send the query anyway?';
  $$refSTR{'checkDB'}           = 'Check Databases';
  $$refSTR{'inDatabase'}        = 'In Database';
  $$refSTR{'Current'}           = 'Current';
  $$refSTR{'updateEntry'}       = 'Update entry';
  $$refSTR{'checkWhois'}        = 'Check Whois Database';
  $$refSTR{'WS_Undefined'}      = 'Undefined';
  $$refSTR{'WS_NoWhoisServer'}  = 'No whois server for this TLD';
  $$refSTR{'noMatch'}           = 'No match';
  $$refSTR{'resolve'}           = 'Resolves to';
  $$refSTR{'query'}             = 'Query';
  $$refSTR{'selectFolder'}      = 'Select a folder';
  # Main Window
  $$refSTR{'btnItemClip'}       = 'View/Edit clipboard content';
  $$refSTR{'lblInput'}          = 'Clipboard content is always used as input data';
  $$refSTR{'errClipboard'}      = 'There is no valid data in the Clipboard...';
  $$refSTR{'Options'}           = 'Options';
  $$refSTR{'WSSelect'}          = 'Registry';
  $$refSTR{'WSSelect1'}         = 'Auto';
  $$refSTR{'lblCheckDB'}        = 'Check db';
  $$refSTR{'cbCheckWhoisDB1'}   = "Don\'t check";
  $$refSTR{'cbCheckWhoisDB2'}   = 'If present, ask';
  $$refSTR{'cbCheckWhoisDB3'}   = 'If present, ignore';
  $$refSTR{'cbCheckWhoisDB4'}   = 'Check after';
  $$refSTR{'chCheckLogging'}    = 'Check Logging Database';
  $$refSTR{'lblAddComment'}     = 'Add comment';
  $$refSTR{'lblNotReady'}       = 'Not Ready? Click here';
  $$refSTR{'notReady'}          = 'Not ready';
  $$refSTR{'nextStep'}          = 'Next step';
  $$refSTR{'btnWhoisTip'}       = 'Send whois request';
  $$refSTR{'btnWinDatabaseTip'} = 'Open Whois Database...';
  $$refSTR{'extractFromClip'}   = 'Extract Network Whois data from clipboard';
  $$refSTR{'btnHelpTip'}        = 'See Help...';
  $$refSTR{'btnAboutTip'}       = 'About this tools...';
  # Clipboard Window
  $$refSTR{'winClip'}           = 'Clipboard';
  $$refSTR{'btnClipParse'}      = 'Parse';
  $$refSTR{'errNoTextData'}     = 'There is no text data in clipboard.';
  $$refSTR{'errNoValidData'}    = 'There is no valid data in the Clipboard.';
  # Config Window
  $$refSTR{'config'}            = 'Settings';
  $$refSTR{'General'}           = 'General';
  $$refSTR{'storage'}           = 'Storage';
  $$refSTR{'Databases'}         = 'Databases';
  $$refSTR{'OpenUserDir'}       = 'Open user dir';
  $$refSTR{'update1'}           = 'You have the latest version installed.';
  $$refSTR{'update2'}           = 'Check for update';
  $$refSTR{'update5'}           = 'is available. Download it';
  $$refSTR{'SetGenOpt'}         = 'Set General options';
  $$refSTR{'winCW'}             = 'Configuration Wizard';
  $$refSTR{'configSet'}         = 'XL-Whois has been configured!';
  $$refSTR{'configSetPart'}     = 'Aborted! XL-Whois has been partially configured.';
  $$refSTR{'firstUse'}          = 'This is your first use of XL-Whois. Do you want to set default configuration?';
  $$refSTR{'defaultDir'}        = 'Do you want to use default dir';
  $$refSTR{'defaultConfigSet'}  = 'Default configuration has been set. Do you want to send a test?';
  # General tab
  $$refSTR{'tool'}              = 'Tool';
  $$refSTR{'Export'}            = 'Export';
  $$refSTR{'checkUpdate'}       = 'Check Update';
  $$refSTR{'chAutoUpdate'}      = 'Check for update at startup';
  $$refSTR{'lblParser'}         = 'Parser';
  $$refSTR{'chStartMinimized'}  = 'Start in taskbar (minimized)';
  $$refSTR{'NWMode'}            = 'Network whois mode';
  $$refSTR{'NWModeNormal'}      = 'Normal';
  $$refSTR{'NWModeRDAP'}        = 'RDAP';
  $$refSTR{'lblNsLookupTO1'}    = 'Nslookup timeout';
  $$refSTR{'lblNsLookupTO2'}    = 'seconds';
  $$refSTR{'UserAgent'}         = 'User-Agent';
  # Storage tab
  $$refSTR{'lblReport'}           = 'Folder for reports';
  $$refSTR{'createReportFolder'}  = 'Create folder for reports';
  $$refSTR{'chAutoViewing'}       = 'Auto viewing, max reports:';
  $$refSTR{'btnReportDirTip'}     = 'Select a folder where reports will be saved';
  $$refSTR{'btnOpenDirTip'}       = 'Open report directory';
  $$refSTR{'chReplace'}           = 'If report exists, replace it';
  $$refSTR{'chAutoViewDir'}       = 'Open folder when finished';
  $$refSTR{'lblLogDbFile'}        = 'Logging Database';
  $$refSTR{'chLogActivate'}       = 'Activate logging' ;
  $$refSTR{'btnLogDbFileNewTip'}  = 'Create a new Logging Database';
  $$refSTR{'btnLogDbViewTip'}     = 'View Logging Database';
  $$refSTR{'btnLogDbFileNew'}     = 'Select the Logging Database location:';
  $$refSTR{'btnDbFileNewTip'}     = 'Create a new Whois Database';
  $$refSTR{'btnDbFileNew'}        = 'Select the Whois Database location:';
  $$refSTR{'btnWhoisDbViewTip'}   = 'View Whois Database';
  $$refSTR{'chDBCache'}           = 'Store Network whois data (in .\cache)';
  $$refSTR{'chGetRelRangeCache'}  = 'Store "Get related ranges" searches (in .\searches)';
  # Databases tab
  $$refSTR{'lblTLDDB'}            = 'TLD Database';
  $$refSTR{'lblWSDB'}             = 'Whois Server Database';  
  $$refSTR{'lblIPv4DB'}           = 'IPv4 Database';  
  $$refSTR{'lblIPv6DB'}           = 'IPv6 Database';
  $$refSTR{'chDBAutoUpt'}         = 'Check update on startup';
  $$refSTR{'CheckUpdateFor'}      = 'Check update for';
  $$refSTR{'HasBeenUpdated'}      = 'has been updated';
  $$refSTR{'NotExistDownload'}    = 'does not exist, download';
  $$refSTR{'currDBDate'}          = 'Current DB date';
  $$refSTR{'remoteDBDate'}        = 'DB date on';
  $$refSTR{'updateAvailable'}     = 'An update of the database is available, download';
  $$refSTR{'DBUpToDate'}          = 'Your database is up to date';
  $$refSTR{'GeoIP'}               = 'GeoIP';
  $$refSTR{'GeoIPDB'}             = 'GeoIP Database'; 
  # Whois Database Window
  $$refSTR{'winDB'}               = 'Whois Database';
  $$refSTR{'btnImportDBTip'}      = 'Import to Database';
  $$refSTR{'btnExtract2DBTip'}    = 'Extract whois info from a file';
  $$refSTR{'previous'}            = 'previous';
  $$refSTR{'next'}                = 'next';
  $$refSTR{'lblFilterDB'}         = 'Filter';
  $$refSTR{'btnFilterDBTip'}      = 'Use Filter';
  $$refSTR{'btnFilterDB_delTip'}  = 'Delete filters';
  $$refSTR{'btnFilterDB_addTip'}  = 'Add filter';
  $$refSTR{'Selected'}            = 'Selected';
  $$refSTR{'NotSelected'}         = 'Not selected';
  $$refSTR{'showProperties'}      = 'Properties...';
  $$refSTR{'FindInLogDB'}         = 'Find in Logging database';
  $$refSTR{'getAllRanges'}        = 'Get all related ranges';
  $$refSTR{'gridSelectAll'}       = 'Select All';
  $$refSTR{'lineCopy'}            = 'Copy lines';
  $$refSTR{'deleteLine'}          = 'Delete lines';
  $$refSTR{'numberISP'}           = 'Number of ISP';
  $$refSTR{'totalNumberISP'}      = 'Total number of ISP';
  $$refSTR{'added'}               = 'added';
  $$refSTR{'modified'}            = 'modified';
  $$refSTR{'deleted'}             = 'deleted';
  $$refSTR{'displayed'}           = 'displayed';
  $$refSTR{'ImportingData'}       = 'Importing data...';
  $$refSTR{'selectFileExtract'}   = 'Select files to extract:';
  $$refSTR{'errFileSelectedMax'}  = 'No file or too much file selected. Maximum selection is around 190 files.';
  $$refSTR{'updatingDB'}          = 'Updating database...';
  $$refSTR{'notFound'}            = 'Not found';
  $$refSTR{'notFoundStr'}         = 'Searched IP or string has not been found.';
  $$refSTR{'noMoreResults'}       = 'No more results.';
  $$refSTR{'equal'}               = 'equal';
  $$refSTR{'notEqual'}            = 'not equal';
  $$refSTR{'greater'}             = 'greater';
  $$refSTR{'greaterEqual'}        = 'greater or equal';
  $$refSTR{'lower'}               = 'lower';
  $$refSTR{'lowerEqual'}          = 'lower or equal';
  $$refSTR{'contains'}            = 'contains';
  $$refSTR{'notContains'}         = 'not contains';
  $$refSTR{'deletingISP'}         = 'Deleting ISP entries...';
  $$refSTR{'sortProgress'}        = 'Sorting in progress';
  # Add ISP Ranges Window
  $$refSTR{'winAddRanges'}        = 'Add ISP Ranges';
  $$refSTR{'Organisation'}        = 'Organisation';
  $$refSTR{'Source'}              = 'Source';
  $$refSTR{'OrgID'}               = 'Org ID';
  $$refSTR{'ASN'}                 = 'ASN';
  $$refSTR{'AdminC'}              = 'Admin-c';
  $$refSTR{'Route'}               = 'Route';
  $$refSTR{'Org'}                 = 'Org';
  $$refSTR{'Formatted'}           = 'Formatted';
  $$refSTR{'Treeview'}            = 'Treeview';
  $$refSTR{'Raw'}                 = 'Raw';
  $$refSTR{'identifyReg'}         = 'Identify appropriate registry';
  $$refSTR{'SearchFor'}           = 'Search for';
  $$refSTR{'ParsingResp'}         = 'Data received. Parsing data';
  $$refSTR{'customerRange'}       = 'This is a customer range, get the parent related ranges';
  $$refSTR{'RelatedRanges'}       = 'Related ranges';
  $$refSTR{'AllRanges'}           = 'All ranges';
  $$refSTR{'ParentOnly'}          = 'Parent only';
  $$refSTR{'SmallerOnly'}         = 'Smaller only';
  $$refSTR{'RemNetNames'}         = 'Remove Netnames';
  $$refSTR{'First'}               = 'First';
  $$refSTR{'Second'}              = 'Second';
  $$refSTR{'Last'}                = 'Last';
  $$refSTR{'ChoiceOfEachRow'}     = 'choice of each row';
  $$refSTR{'Previous'}            = 'Previous';
  $$refSTR{'winAddRSelected'}     = 'Add selected ranges';
  $$refSTR{'applyFilters'}        = 'Browse grid and apply filter';
  $$refSTR{'noASNorIDFound'}      = 'No ASN or ID found.';
  $$refSTR{'noRangeISP'}          = 'No other ranges found for the ISP.';
  # Network Whois Properties Window
  $$refSTR{'winNWP'}          = 'Network Whois properties';
  $$refSTR{'From'}            = 'From';
  $$refSTR{'To'}              = 'To';
  $$refSTR{'CIDR'}            = 'CIDR';
  $$refSTR{'GetUpdate'}       = 'Get/Update';
  $$refSTR{'NWProperties'}    = 'Properties';
  $$refSTR{'NWData'}          = 'Network whois data';
  $$refSTR{'getGeoIP'}        = 'Get GeoIP data';
  $$refSTR{'ISPAdded'}        = 'The entry has been added to database.';
  $$refSTR{'ISPModified'}     = 'The entry has been modified in database.';
  $$refSTR{'rangeNotFound'}   = 'No match for the selected range.';
  $$refSTR{'ModifyIt'}        = 'Do you want to modify it ?';
  $$refSTR{'ISPDiff'}         = 'ISP name has changed. Click on save button to modify the entry in database.';
  $$refSTR{'NonPublicAddr'}   = 'Not a public IP address.';
  # Filter window
  $$refSTR{'winFilter'}       = 'Filters';
  $$refSTR{'lblAddFilterOp'}  = 'Add Filter Operator:';
  $$refSTR{'lblFilterField'}  = 'Field';
  $$refSTR{'cbFilterField1'}  = 'StartIP';
  $$refSTR{'cbFilterField2'}  = 'EndIP';
  $$refSTR{'lblOperator'}     = 'Operator:';
  $$refSTR{'lblFilterValue'}  = 'Value:' ;
  $$refSTR{'btnApplyFilter'}  = 'Apply Filters';
  # Analysis Whois Database Window (AWD)
  $$refSTR{'winAWD'}          = 'Analyse Whois Database';
  $$refSTR{'lblChoice'}       = 'Matches found';
  $$refSTR{'lblISPWide'}      = 'This ISP range:';
  $$refSTR{'lblISPin'}        = 'Includes the following ISPs:';
  $$refSTR{'lblISPMsg'}       = 'Uncheck entry that you want to delete and push Next to continue.';
  $$refSTR{'btnAWDNext'}      = 'Next';
  # Logging Database Window
  $$refSTR{'winLogDB'}          = 'Logging Database';
  $$refSTR{'date'}              = 'Date';
  $$refSTR{'request'}           = 'Request';
  $$refSTR{'details'}           = 'Details';
  $$refSTR{'comment'}           = 'Comment';
  $$refSTR{'openReport'}        = 'Open report';
  $$refSTR{'deletingEntries'}   = 'Deleting entries...';
  $$refSTR{'selectLogFile'}     = 'Select the log file:';
  # Report
  $$refSTR{'NetRange'}          = 'Net Range';
  $$refSTR{'Handle'}            = 'Handle';
  $$refSTR{'ParentHandle'}      = 'Parent Handle';
  $$refSTR{'Name'}              = 'Name';
  $$refSTR{'NicbAutnum'}        = 'Nicbr autnum';
  $$refSTR{'Remark'}            = 'Remark';
  $$refSTR{'Notice'}            = 'Notice';
  $$refSTR{'Entities'}          = 'Entities';
  $$refSTR{'Role'}              = 'Role';
  $$refSTR{'Status'}            = 'Status';
  $$refSTR{'Status'}            = 'Status';
  $$refSTR{'Address'}           = 'Address';
  $$refSTR{'Phone'}             = 'Phone';
  $$refSTR{'Link'}              = 'Link';
  $$refSTR{'Continent'}         = 'Continent';
  $$refSTR{'countryCode'}       = 'Country (code)';
  $$refSTR{'Country'}           = 'Country';
  $$refSTR{'regionCode'}        = 'Region (code)';
  $$refSTR{'Region'}            = 'Region';
  $$refSTR{'City'}              = 'City';
  $$refSTR{'postalCode'}        = 'Postal code';
  $$refSTR{'gpsLat'}            = 'GPS Latitude';
  $$refSTR{'gpsLong'}           = 'GPS Longitude';
  $$refSTR{'tzName'}            = 'Timezone';
  $$refSTR{'tzOffset'}          = 'Timezone (offset)';
  # Simple Progress window
  $$refSTR{'winPb'}           = 'Progress';
  # About Window
  $$refSTR{'About'}           = 'About';
  $$refSTR{'Version'}         = 'Version';
  $$refSTR{'Author'}          = 'Author';
  $$refSTR{'TranslatedBy'}    = 'Translated by';
  $$refSTR{'Website'}         = 'Website';
  $$refSTR{'translatorName'}  = '-';
  
}  #--- End loadStrings

#------------------------------------------------------------------------------#
1;