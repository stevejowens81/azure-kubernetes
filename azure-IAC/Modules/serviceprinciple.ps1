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

 .PARAMETER subscriptionID
    x.
#>
Param(
    [string] [Parameter(Mandatory=$true)] $KUBRGName,
    [string] [Parameter(Mandatory=$true)] $subscriptionID
    )

#Create a Service Principle
$SP=$(az ad sp create-for-rbac --role='Contributor' --scopes='/subscriptions/'$subscriptionID'/resourceGroups/'$KUBRGName)

$ServicePrinciple = $SP | ConvertFrom-Json

Write-host $env:SvcPrincipleCliID
Write-host $env:SvcPrincipleCliSec

$SvcPrincipleCliID = $ServicePrinciple.appId
$SvcPrincipleCliSec = $ServicePrinciple.password

Write-Output  ("##vso[task.setvariable variable=SvcPrincipleCliID]$SvcPrincipleCliID")
Write-Output  ("##vso[task.setvariable variable=SvcPrincipleCliSec]$SvcPrincipleCliSec")

Write-host $env:SvcPrincipleCliID
Write-host $env:SvcPrincipleCliSec