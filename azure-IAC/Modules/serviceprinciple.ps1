# Requires -Version 3.0
# Content Version : 1.0.0.1
# Creator - Steve Owens
<#
 .SYNOPSIS
    Create a ServicePrinciple for the Kubernetes Cluster

 .DESCRIPTION
    Create a ServicePrinciple for the Kubernetes Cluster

 .PARAMETER KUBRGName
    x.

.PARAMETER Location
    x.

 .PARAMETER subscriptionID
    x.
#>
Param(
    [string] $KUBRGName = $env:KUBRGName,
    [string] $KUBLocation = $env:KUBLocation,
    [string] $subscriptionID = $env:subscriptionID
    )

#Create a Service Principle
az group create --name $KUBRGName --location "$KUBLocation"
$SP=$(az ad sp create-for-rbac --role='Contributor' --scopes='/subscriptions/'$subscriptionID'/resourceGroups/'$KUBRGName)

$ServicePrinciple = $SP | ConvertFrom-Json

Write-host $env:SvcPrincipleCliID
Write-host $env:SvcPrincipleCliSec

$SvcPrincipleCliID = $ServicePrinciple.appId
$SvcPrincipleCliSec = $ServicePrinciple.password

Write-Output  ("##vso[task.setvariable variable=SvcPrincipleCliID]$SvcPrincipleCliID")
Write-Output  ("##vso[task.setvariable variable=SvcPrincipleCliSec]$SvcPrincipleCliSec")

Write-host $env:SvcPrincipleCliID
Write-host $env:SvcPrincipleCliSec4
