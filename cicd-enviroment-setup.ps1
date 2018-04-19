# Requires -Version 3.0
# Content Version : 1.0.0.1
# Creator - Steve Owens
<#
 .SYNOPSIS
    Sets the VSTS pipeline parameters.

 .DESCRIPTION
    Sets the VSTS pipeline parameters.

 .PARAMETER OMSName
    x.

 .PARAMETER KUBClusterName
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

 .PARAMETER x
    x.

#>
Param(
    [string] $OMSName = 'BJSS-DEMO-OMS',
    [string] $OMSLocation = 'West Europe',
    [string] $KUBClusterName = 'BJSS-DEMO-ACS',
	[string] $KUBLocation = 'West Europe',
    [string] $OMSRGName = $OMSName + '-RG',
    [string] $KUBRGName = $KUBClusterName + '-RG'
)

Write-Host "##vso[task.setvariable variable=OMSRGName]$OMSRGName"
Write-Host "##vso[task.setvariable variable=OMSName]$OMSName"
Write-Host "##vso[task.setvariable variable=OMSLocation]$OMSLocation"
Write-Host "##vso[task.setvariable variable=KUBRGName]$KUBRGName"
Write-Host "##vso[task.setvariable variable=KUBClusterName]$KUBClusterName"
Write-Host "##vso[task.setvariable variable=KUBLocation]$KUBLocation"