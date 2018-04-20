# Requires -Version 3.0
# Content Version : 1.0.0.1
# Creator - Steve Owens
<#
 .SYNOPSIS
    Create a ServicePrinciple for the Kubernetes Cluster

 .DESCRIPTION
    Create a ServicePrinciple for the Kubernetes Cluster

 .PARAMETER SvcPrincipleCliID
    x.

.PARAMETER KUBRGName
    x.

#>
Param(
    [string] $SvcPrincipleCliID,
    [string] $KUBRGName
    )

# Delete the Service Principal

az ad sp delete --id $SvcPrincipleCliID

# Delete the Resource Group
az group delete --name $KUBRGName