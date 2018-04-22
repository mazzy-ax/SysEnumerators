#
# mazzy, https://github.com/mazzy-ax/SysEnumerators
#
# The script rebuilds files in the (Src, Test, Examples) directories based on *.xpo project files

#Requires -Version 5
#Requires -module xpoTools
#Requires -module SplitPipeline

# To install the modules from https://www.powershellgallery.com/ run powershell commands:
# PS> Install-Module xpoTools
# PS> install-Module SplitPipeline
#
# see https://github.com/mazzy-ax/xpoTools and https://github.com/nightroman/SplitPipeline for details

Set-StrictMode -Version Latest

'ax2009', 'ax2012', 'ax3', 'ax4' | ForEach-Object {
    $Path = $_

    Get-ChildItem $Path -filter '*.xpo' |
        Select-Object -ExpandProperty FullName |
        Import-Xpo |
        ForEach-Object {
        #Split-Pipeline -Verbose -Load 10 -Variable Path {process{
            Split-xpo -Items $_ -DestinationPathParts @($Path        ) -Include 'Job_*.xpp' -xpp -PathStyle mazzy -Encoding UTF8
            Split-xpo -Items $_ -DestinationPathParts @($Path, 'Test') -Include '*test.xpp' -xpp -PathStyle mazzy -Encoding UTF8
            Split-xpo -Items $_ -DestinationPathParts @($Path, 'Src' ) -Exclude '*test.xpp', 'Job_*.xpp', 'SharedProject_*.xpo' -xpp -PathStyle mazzy -Encoding UTF8
    #}}
    }
}