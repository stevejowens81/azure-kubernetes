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
    [string] $OMSName = 'BJSS-DEMO1-OMS',
    [string] $OMSLocation = 'West Europe',
    [string] $KUBClusterName = 'BJSS-DEMO1-ACS',
	[string] $KUBLocation = 'West Europe',
    [string] $OMSRGName = $OMSName + '-RG',
    [string] $KUBRGName = $KUBClusterName + '-RG'
)

Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation

Write-Output  ("##vso[task.setvariable variable=OMSRGName]$OMSRGName")
Write-Output  ("##vso[task.setvariable variable=OMSName]$OMSName")
Write-Output  ("##vso[task.setvariable variable=OMSLocation]$OMSLocation")
Write-Output  ("##vso[task.setvariable variable=KUBRGName]$KUBRGName")
Write-Output  ("##vso[task.setvariable variable=KUBClusterName]$KUBClusterName")
Write-Output  ("##vso[task.setvariable variable=KUBLocation]$KUBLocation")

Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation