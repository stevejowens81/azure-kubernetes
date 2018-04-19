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

Write-host $env:VarOMSRGName
Write-host $env:VarOMSName
Write-host $env:VarOMSLocation
Write-host $env:VarKUBRGName
Write-host $env:VarKUBClusterName
Write-host $env:VarKUBLocation

Write-Output  ("##vso[task.setvariable variable=VarOMSRGName]$OMSRGName")
Write-Output  ("##vso[task.setvariable variable=VarOMSName]$OMSName")
Write-Output  ("##vso[task.setvariable variable=VarOMSLocation]$OMSLocation")
Write-Output  ("##vso[task.setvariable variable=VarKUBRGName]$KUBRGName")
Write-Output  ("##vso[task.setvariable variable=VarKUBClusterName]$KUBClusterName")
Write-Output  ("##vso[task.setvariable variable=VarKUBLocation]$KUBLocation")

Write-host $env:VarOMSRGName
Write-host $env:VarOMSName
Write-host $env:VarOMSLocation
Write-host $env:VarKUBRGName
Write-host $env:VarKUBClusterName
Write-host $env:VarKUBLocation