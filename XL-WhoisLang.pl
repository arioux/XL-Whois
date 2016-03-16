#!/usr/bin/perl
# Perl - v: 5.16.3
#------------------------------------------------------------------------------#
# XL-WhoisLang.pl : Strings for XL-Whois
# Website         : http://le-tools.com/
# GitHub		      : https://github.com/arioux/XL-Whois
# Creation        : 2015-09-30
# Modified        : 2015-12-10
# Author          : Alain Rioux (admin@le-tools.com)
#
# Copyright (C) 2015  Alain Rioux (le-tools.com)
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
  # Local variables
  my $refSTR = shift;
  
  # Set default strings
  
  # General strings
  $$refSTR{'cancel'}            = 'Cancel';
  $$refSTR{'error'}             = 'Error';
  $$refSTR{'errDB'}             = 'Error database: ';
  $$refSTR{'errCreatingDB'}     = 'Error creating database: ';
  $$refSTR{'errNoDB'}           = 'No database file.';
  $$refSTR{'errorMsg'}          = 'Error messsage';
  $$refSTR{'errConnectingDB'}   = 'Error connecting database: ';
  $$refSTR{'errLoadingDB'}      = 'Error loading database.';
  $$refSTR{'errUpdatingDB'}     = 'Error updating database: ';
  $$refSTR{'errReading'}        = 'Error reading file: ';
  $$refSTR{'errWriting'}        = 'Error writing file: ';
  $$refSTR{'errNoValidFile'}    = 'File does not seem valid.';
  $$refSTR{'errFileEmpty'}      = 'File seems empty.';
  $$refSTR{'errNewLine'}        = 'Error creating new line in grid.';
  $$refSTR{'errProcessRun'}     = 'A process is already running. Wait until it stops or restart the program.';
  $$refSTR{'errParams'}         = 'Error parameters.';
  $$refSTR{'errResolver'}       = 'Unable to resolve domain name or IP address.';
  $$refSTR{'errWritingReport'}  = 'Error writing report: ';
  $$refSTR{'errViewingReport'}  = 'Error viewing report: ';
  $$refSTR{'errWritingCache'}   = 'Error writing Network Whois Data to cache: ';
  $$refSTR{'errUpdateLoggingDB'}    = 'Error writing to Logging Database: ';
  $$refSTR{'errCreatingLoggingDB'}  = 'Error creating the Logging Database: ';
  $$refSTR{'errCreatingWhoisDB'}    = 'Error creating the Whois Database: ';
  $$refSTR{'errTableWhoisDB'}   = 'Whois Database is not valid: No Whois table found.';
  $$refSTR{'errTableLoggingDB'} = 'Logging Database is not valid: No Logging table found.';
  $$refSTR{'errDocumentation'}  = 'Documentation.chm have not been found in the program folder.';
  $$refSTR{'errConnection'}     = 'Error Connection';
  $$refSTR{'errUnknown'}        = 'Unknown error';
  $$refSTR{'selectValidFile'}   = 'You must select a valid file.';
  $$refSTR{'dbCreated'}         = 'The database has been created.';
  $$refSTR{'exportSucess'}      = 'Exporting successfull';
  $$refSTR{'exporting'}         = 'Exporting';
  $$refSTR{'analysing'}         = 'Analysing';
  $$refSTR{'cancelling'}        = 'Cancelling...';
  $$refSTR{'searching'}         = 'Searching';
  $$refSTR{'connecting'}        = 'Connecting to';
  $$refSTR{'readyParserOpt'}    = 'Select a object to parse (IPv4, IPv6, Hostname, Domain name)';
  $$refSTR{'readySelWhoisOpt'}  = 'Select a whois option (Domain, Network, DNS)';
  $$refSTR{'readySelWhoisDB'}   = 'Select the Whois Database location or create a new one';
  $$refSTR{'readySelLoggingDB'} = 'Select the Logging Database location or desactivate logging';
  $$refSTR{'readySelTLDDB'}     = 'Select the TLD Database location or download it';
  $$refSTR{'readySelWSDB'}      = 'Select the Whois Server Database location or download it';
  $$refSTR{'whoisProgress'}     = 'Whois in progress...';
  $$refSTR{'ISP'}               = 'ISP';
  $$refSTR{'item'}              = 'Item';
  $$refSTR{'wasFoundWhoisDB'}   = 'was found in the Whois Database';
  $$refSTR{'wasFoundLoggingDB'} = 'was found in the Logging Database';
  $$refSTR{'more3entries'}      = 'There are more than 3 entries found for';
  $$refSTR{'inLoggingDBLast3'}  = 'in Logging Database. Last 3 entries';
  $$refSTR{'sendQueryAnyway'}   = 'Send the query anyway ?';
  $$refSTR{'checkDB'}           = 'Check Databases';
  $$refSTR{'inDatabase'}        = 'In Database';
  $$refSTR{'current'}           = 'Current';
  $$refSTR{'updateEntry'}       = 'Update entry';
  $$refSTR{'current'}           = 'Current';
  $$refSTR{'checkWhois'}        = 'Check Whois Database';
  $$refSTR{'WS_Undefined'}      = 'Undefined';
  $$refSTR{'WS_NoWhoisServer'}  = 'No whois server for this TLD';
  $$refSTR{'noMatch'}           = 'No match';
  $$refSTR{'report'}            = 'report';
  $$refSTR{'resolve'}           = 'Resolves to';
  $$refSTR{'query'}             = 'Query';
  $$refSTR{'firstUse'}          = 'This is your first use of XL-Whois. Do you want to set default configuration ?';
  $$refSTR{'defaultDir'}        = 'Do you want to use default dir';
  $$refSTR{'selectFolder'}       = 'Select a folder';
  $$refSTR{'createReportFolder'} = 'Create Folder for reports';
  $$refSTR{'downloadTLDDB'}     = 'Download TLD Database';
  $$refSTR{'downloadWSDB'}      = 'Download Whois Server Database';
  $$refSTR{'errDownloadTLDDB'}  = 'Error downloading TLD Database';
  $$refSTR{'errDownloadWSDB'}   = 'Error downloading Whois Server Database';
  $$refSTR{'downloadIPv4DB'}    = 'Download IPv4 Database';
  $$refSTR{'errDownloadIPv4DB'} = 'Error downloading IPv4 Database';
  $$refSTR{'downloadIPv6DB'}    = 'Download IPv6 Database';
  $$refSTR{'errDownloadIPv6DB'} = 'Error downloading IPv6 Database';
  $$refSTR{'defaultConfigSet'}  = 'Default configuration has been set. Do you want to send a test ?';
  
  # Main Window
  $$refSTR{'btnItemClip'}       = 'View/Edit clipboard content';
  $$refSTR{'lblInput'}          = 'Clipboard content is always used as input data';
  $$refSTR{'errClipboard'}      = 'There is no valid data in the Clipboard...';
  $$refSTR{'Options'}           = 'Options';
  $$refSTR{'WSSelect'}          = 'Registry';
  $$refSTR{'WSSelect1'}         = 'Auto';
  $$refSTR{'lblCheckDB'}        = 'Check db:';
  $$refSTR{'cbCheckWhoisDB1'}   = "Don\'t check";
  $$refSTR{'cbCheckWhoisDB2'}   = 'If present, ask';
  $$refSTR{'cbCheckWhoisDB3'}   = 'If present, ignore';
  $$refSTR{'cbCheckWhoisDB4'}   = 'Check after';
  $$refSTR{'chCheckLogging'}    = 'Check Logging Database';
  $$refSTR{'lblAddComment'}     = 'Add comment';
  $$refSTR{'lblNotReady'}       = 'Not Ready ? Click here';
  $$refSTR{'notReady'}          = 'Not ready';
  $$refSTR{'nextStep'}          = 'Next step';
  $$refSTR{'btnWhoisTip'}       = 'Send whois request';
  $$refSTR{'btnWinDatabaseTip'} = 'Open Whois Database...';
  $$refSTR{'btnHelpTip'}        = 'See Help...';
  $$refSTR{'btnAboutTip'}       = 'About this tools...';
  
  # Taskbar menu
  $$refSTR{'menu1'}           = 'Show XL-Whois';
  $$refSTR{'menu2'}           = 'Whois';
  $$refSTR{'menu3'}           = 'Show Whois Database...';
  $$refSTR{'menu4'}           = 'Show Logging Database...';
  $$refSTR{'menu5'}           = 'Help...';
  $$refSTR{'menu6'}           = 'Quit';
  
  # Clipboard Window
  $$refSTR{'winClip'}         = 'Clipboard';
  $$refSTR{'btnClipOk'}       = 'OK';
  $$refSTR{'btnClipEdit'}     = 'Edit';
  $$refSTR{'btnClipParse'}    = 'Parse';
  $$refSTR{'errNoTextData'}   = 'There is no text data in clipboard.';
  $$refSTR{'errNoValidData'}  = 'There is no valid data in the Clipboard.';
  
  # Config Window
  $$refSTR{'config'}              = 'Config';
  $$refSTR{'general'}             = 'General';
  $$refSTR{'storage'}             = 'Storage';
  $$refSTR{'database'}            = 'Databases';
  $$refSTR{'update1'}             = 'You have the latest version installed.';
  $$refSTR{'update2'}             = 'Check for update';
  $$refSTR{'update3'}             = 'Update';
  $$refSTR{'update4'}             = 'Version';
  $$refSTR{'update5'}             = 'is available. Download it';
  $$refSTR{'SetGenOpt'}           = 'Set General options';
  $$refSTR{'winCW'}               = 'Configuration Wizard';
  $$refSTR{'configSet'}           = 'XL-Tool has been configured !';
  $$refSTR{'configSetPart'}       = 'Aborted ! XL-Tool has been partially configured.';
  # General tab
  $$refSTR{'tool'}                = 'Tool';
  $$refSTR{'export'}              = 'Export';
  $$refSTR{'checkUpdate'}         = 'Check Update';
  $$refSTR{'chAutoUpdate'}        = 'Check for update at startup';
  $$refSTR{'lblParser'}           = 'Parser';
  $$refSTR{'chStartMinimized'}    = 'Start in taskbar (minimized)';
  $$refSTR{'lblNsLookupTO1'}      = 'Nslookup timeout';
  $$refSTR{'lblNsLookupTO2'}      = 'seconds';
  $$refSTR{'UserAgent'}           = 'User-Agent';
  # Storage tab
  $$refSTR{'lblReport'}           = 'Folder for reports:';
  $$refSTR{'chAutoViewing'}       = 'Auto viewing, max reports:';
  $$refSTR{'btnReportDirTip'}     = 'Select a folder where reports will be saved';
  $$refSTR{'btnOpenDirTip'}       = 'View content directory in Windows Explorer';
  $$refSTR{'chReplace'}           = 'If report exists, replace it';
  $$refSTR{'chAutoViewDir'}       = 'Open folder when finished';
  $$refSTR{'lblLogDbFile'}        = 'Logging Database location:';
  $$refSTR{'chLogActivate'}       = 'Activate logging' ;
  $$refSTR{'btnLogDbFileTip'}     = 'Select the Logging Database file';
  $$refSTR{'btnLogDbFileNewTip'}  = 'Create a new Logging Database';
  $$refSTR{'btnLogDbViewTip'}     = 'View Logging Database';
  $$refSTR{'btnLogDbFileNew'}     = 'Select the Logging Database location:';
  $$refSTR{'lblDbFile'}           = 'Whois Database location:';
  $$refSTR{'chDBCache'}           = 'Store Network whois data';
  $$refSTR{'btnDbFileTip'}        = 'Select the Whois Database file';
  $$refSTR{'btnDbFileNewTip'}     = 'Create a new Whois Database';
  $$refSTR{'btnDbFileNew'}        = 'Select the Whois Database location:';
  $$refSTR{'btnWhoisDbViewTip'}   = 'View Whois Database';
  # Databases tab
  $$refSTR{'lblTLDDB'}            = 'TLD Database location:';
  $$refSTR{'chDBAutoUpt'}         = 'Check update on startup';
  $$refSTR{'btnTLDDBTip'}         = 'Select the TLD database file';
  $$refSTR{'btnTLDDBUptTip'}      = 'Check update for TLD Database';
  $$refSTR{'lblWSDB'}             = 'Whois Server Database location:';
  $$refSTR{'btnWSDBTip'}          = 'Select the Whois Server database file';
  $$refSTR{'btnWSDBUptTip'}       = 'Check update for Whois Server Database';
  $$refSTR{'lblIPv4DB'}           = 'IPv4 Database location:';
  $$refSTR{'btnIPv4DBTip'}        = 'Select the IPv4 database file';
  $$refSTR{'btnIPv4DBUptTip'}     = 'Check update for IPv4 Database';
  $$refSTR{'lblIPv6DB'}           = 'IPv6 Database location:';
  $$refSTR{'btnIPv6DBTip'}        = 'Select the IPv6 database file';
  $$refSTR{'btnIPv6DBUptTip'}     = 'Check update for IPv6 Database';
  $$refSTR{'errDownloadingDB'}    = 'Error downloading Database...';
  $$refSTR{'updateTLDDB'}         = 'Update TLD Database';
  $$refSTR{'updatedTLDDB'}        = 'The TLD database has been updated';
  $$refSTR{'updateWSDB'}          = 'Update Whois Server Database';
  $$refSTR{'updatedWSDB'}         = 'The Whois Server database has been updated';
  $$refSTR{'updateIPv4DB'}        = 'Update IPv4 Database';
  $$refSTR{'updatedIPv4DB'}       = 'The IPv4 database has been updated';
  $$refSTR{'updateIPv6DB'}        = 'Update IPv6 Database';
  $$refSTR{'updatedIPv6DB'}       = 'The IPv6 database has been updated';
  $$refSTR{'currDBDate'}          = 'Current DB date';
  $$refSTR{'remoteDBDate'}        = 'DB date on';
  $$refSTR{'updateAvailable'}     = 'An update of the database is available, download';
  $$refSTR{'DBUpToDate'}          = 'Your database is up to date';
  $$refSTR{'TLDDBNotExist'}       = 'The TLD database (effective_tld_names.dat) does not exist, download';
  $$refSTR{'WSDBNotExist'}        = 'The Whois Server database (tld.json) does not exist, download';
  $$refSTR{'IPv4DBNotExist'}      = 'The IPv4 database (ipv4-address-space.csv) does not exist, download';
  $$refSTR{'IPv6DBNotExist'}      = 'The IPv6 database (ipv6-unicast-address-assignments.csv) does not exist, download';
  
  # Whois Database Window
  $$refSTR{'winDB'}               = 'Whois Database';
  $$refSTR{'btnExportDBTip'}      = 'Export Database';
  $$refSTR{'btnImportDBTip'}      = 'Import to Database';
  $$refSTR{'btnExtract2DBTip'}    = 'Extract whois info from a file';
  $$refSTR{'btnValidDBTip'}       = 'Analyse Database';
  $$refSTR{'lblSearchDB'}         = 'Search';
  $$refSTR{'btnSearchDBTip'}      = 'Search database';
  $$refSTR{'btnSearchDB_pTip'}    = 'Search previous';
  $$refSTR{'btnSearchDB_nTip'}    = 'Search next';
  $$refSTR{'lblFilterDB'}         = 'Filter';
  $$refSTR{'btnFilterDBTip'}      = 'Use Filter';
  $$refSTR{'btnFilterDB_delTip'}  = 'Delete filters';
  $$refSTR{'btnFilterDB_addTip'}  = 'Add filter';
  $$refSTR{'gridSelectAll'}       = 'Select All';
  $$refSTR{'lineCopy'}            = 'Copy lines';
  $$refSTR{'deleteLine'}          = 'Delete lines';
  $$refSTR{'numberISP'}           = 'Number of ISP';
  $$refSTR{'totalNumberISP'}      = 'Total number of ISP';
  $$refSTR{'added'}               = 'added';
  $$refSTR{'modified'}            = 'modified';
  $$refSTR{'deleted'}             = 'deleted';
  $$refSTR{'displayed'}           = 'displayed';
  $$refSTR{'importingWhoisData'}  = 'Importing Whois data...';
  $$refSTR{'exportingWhoisDB'}    = 'Exporting Whois Database...';
  $$refSTR{'selectFileExtract'}   = 'Select files to extract:';
  $$refSTR{'errFileSelectedMax'}  = 'No file or too much file selected. Maximum selection is around 190 files.';
  $$refSTR{'extractingFiles'}     = 'Extracting files...';
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
  $$refSTR{'errReadingNetworkData'} = 'Error reading Network Whois Data file: ';
  $$refSTR{'deletingISP'}         = 'Deleting ISP entries...';
  
  # Network Whois Data Window
  $$refSTR{'winNWD'} = 'Network Whois Data';
  
  # Filter window
  $$refSTR{'winFilter'}       = 'Filters';
  $$refSTR{'lblAddFilterOp'}  = 'Add Filter Operator:';
  $$refSTR{'lblFilterField'}  = 'Field';
  $$refSTR{'cbFilterField1'}  = 'Start IP';
  $$refSTR{'cbFilterField2'}  = 'End IP';
  $$refSTR{'cbFilterField3'}  = 'ISP';
  $$refSTR{'cbFilterField4'}  = 'Country';
  $$refSTR{'lblOperator'}     = 'Operator:';
  $$refSTR{'lblFilterValue'}  = 'Value:' ;
  $$refSTR{'btnApplyFilter'}  = 'Apply Filters';
  
  # Analysis Whois Database Window (AWD)
  $$refSTR{'winAWD'}          = 'Analyse Whois Database';
  $$refSTR{'lblChoice'}       = 'Matches found';
  $$refSTR{'lblISPWide'}      = 'This ISP range:';
  $$refSTR{'lblISPin'}        = 'Includes the following ISPs:';
  $$refSTR{'lblISPMsg'}       = 'Uncheck entry that you want to delete by double-clicking on it and push Next to continue.';
  $$refSTR{'btnAWDNext'}      = 'Next';
  
  # Logging Database Window
  $$refSTR{'winLogDB'}          = 'Logging Database';
  $$refSTR{'date'}              = 'Date';
  $$refSTR{'request'}           = 'Request';
  $$refSTR{'details'}           = 'Details';
  $$refSTR{'comment'}           = 'Comment';
  $$refSTR{'deletingEntries'}   = 'Deleting entries...';
  $$refSTR{'selectLogFile'}     = 'Select the log file:';
  $$refSTR{'importingLoggingData'} = 'Importing Logging data...';
  $$refSTR{'exportingLoggingDB'}   = 'Exporting Logging Database...';
  
  # Simple Progress window
  $$refSTR{'winPb'}       = 'Progress';
  
  # About Window
  $$refSTR{'about'}           = 'About';
  $$refSTR{'version'}         = 'Version';
  $$refSTR{'author'}          = 'Author';
  $$refSTR{'translatedBy'}    = 'Translated by';
  $$refSTR{'website'}         = 'Website';
  $$refSTR{'translatorName'}  = '-';
  
  # Database Update Window


}  #--- End loadStrings


#------------------------------------------------------------------------------#
1;