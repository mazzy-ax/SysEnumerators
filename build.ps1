#
# mazzy, https://github.com/mazzy-ax/SysEnumerators
#
# Rebuild files in the .\ax2009\Src\ directory based on .\ax2009\Projects\*.xpo files

#Requires -Version 5

#Requires -module xpoTools 
# Run powershell command PS> Install-Module xpoTools
# To install the module from https://www.powershellgallery.com/packages/xpoTools/
# see https://github.com/mazzy-ax/xpoTools for details

Set-StrictMode -Version Latest

function splitXpo ($Path) {
    $xpoItem = Get-ChildItem "$Path\\*.xpo" | Import-Xpo
    $xpoItem | Split-xpo -DestinationPath "$Path"       -xpp -PathStyle mazzy -Encoding UTF8 -Include 'Job_*.xpp'
    $xpoItem | Split-xpo -DestinationPath "$Path\\Test"  -xpp -PathStyle mazzy -Encoding UTF8 -Include '*test.xpp'
    $xpoItem | Split-xpo -DestinationPath "$Path\\Src"   -xpp -PathStyle mazzy -Encoding UTF8 -Exclude '*test.xpp', 'Job_*.xpp', 'SharedProject_*.xpo'
}

splitXpo .\ax2009
splitXpo .\ax2012
splitXpo .\ax4
splitXpo .\ax3