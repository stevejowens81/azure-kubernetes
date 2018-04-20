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

 .PARAMETER OMSLocation
    x.

 .PARAMETER KUBClusterName
    x.

 .PARAMETER KUBLocation
    x.

 .PARAMETER KUBDNSName
    The KUBDNSName is the public DNS name for the Kubernetes cluster service, it must be lowercase alphanumerical with no special characters or spaces.

 .PARAMETER KUBPubKey
    x.

 .PARAMETER OMSRGName
    In built paramerter that creates the Azure Resource group name from the OMSName parameter.

 .PARAMETER KUBRGName
    In built paramerter that creates the Azure Resource group name from the KUBName parameter.

 .PARAMETER x
    x.

#>
Param(
    [string] $subscriptionID='1e6bdb83-67fd-4c1a-a023-25dfaaa56331',
    [string] $OMSName = 'BJSS-DEMO-OMS',
    [string] $OMSLocation = 'West Europe',
    [string] $KUBClusterName = 'BJSS-DEMO-ACS',
    [string] $KUBLocation = 'West Europe',
    [string] $KUBDNSName = 'bjssdemoacs', 
    [string] $KUBPubKey = '2048 37 25177143828604063250064581028002300472320888074175236474515166040393389909022427665957041077013892346477166690217682842622860270650742483770880182998849588189805806147848699390321464128691771934882090671914136456428428549399278579386138738350950424156364054252529664604569275648725474843992894231152141778823182961358885234463012297168434172674598859189134948941401887980347861608070994956432263492321484539982673835246566430663455476910688573763810859532905052942599849919578586271999748845059627604430935068402814378264652742447631849695000433752441721959908812098490275294396872461452362865767819422390848686094689 Azure Kubernetes Host Key',
    [string] $OMSRGName = $OMSName + '-RG',
    [string] $KUBRGName = $KUBClusterName + '-RG'
)

Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation
Write-host $env:KUBDNSName
Write-host $env:KUBPubKey

Write-Output  ("##vso[task.setvariable variable=OMSRGName]$OMSRGName")
Write-Output  ("##vso[task.setvariable variable=OMSName]$OMSName")
Write-Output  ("##vso[task.setvariable variable=OMSLocation]$OMSLocation")
Write-Output  ("##vso[task.setvariable variable=KUBRGName]$KUBRGName")
Write-Output  ("##vso[task.setvariable variable=KUBClusterName]$KUBClusterName")
Write-Output  ("##vso[task.setvariable variable=KUBLocation]$KUBLocation")
Write-Output  ("##vso[task.setvariable variable=KUBDNSName]$KUBDNSName")
Write-Output  ("##vso[task.setvariable variable=KUBPubKey]$KUBPubKey")

Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation
Write-host $env:KUBDNSName
Write-host $env:KUBPubKey