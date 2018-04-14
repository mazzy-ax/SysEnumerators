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

Get-ChildItem 'ax2009\Projects\*.xpo' |
    Import-Xpo |
    Split-xpo -DestinationPath 'ax2009\Src' -Exclude SharedProject_*.xpo -PathStyle mazzy -xpp -Encoding UTF8
