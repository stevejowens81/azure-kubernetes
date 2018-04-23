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
    [string] $KUBLocation = 'WestEurope',
    [string] $KUBDNSName = 'bjssdemoacs', 
    [string] $OMSRGName = $OMSName + '-RG',
    [string] $KUBRGName = $KUBClusterName + '-RG',
    [string] $KUBPubKey = 'ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAvIB0oilwQC0LgKM/mflzGiWpekKsPPYZRD6JkZB9HnISVwVWoH1yikdRBDZwNx2AiZz01donf2OqRERM5ka0ynYA/cBGGdScSkEK+HIpk2sXLOxTdJs4gLXX4x6hMZtwoKs4N0U0TPabThgrIgL5veBdXz0xZB8HVrmlCZIvIzXJdaq+Fr8Dm+0FAw5ks43nk95X0uZwEvj9N1zto0yNy+IocnIpurIQ7LgYj91U1XmV85DslJz1PHeAuZ2DpM3vstJuQWqT0/zAWMU/Ic2ltYeFJ/ulyaSulNSAK9YkxYcMjmUHDn6TnhHPKJ3E5tn0Jgi1tclVdAWoLJijZcPitQ== Azure-Kubernetes-Hosts',
    [string] $KUBUsername = 'kubeadmin',
    [string] $KUBVMSize = 'Standard_DS2_v2',
    [string] $KUBNodesQTY = '3',
    [string] $KUBmasterDnsNamePrefix= $KUBDNSName + 'mgmt',
    [string] $KUBagentDnsNamePrefix= $KUBDNSName + 'agents'
)

Write-host $env:subscriptionID
Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation
Write-host $env:KUBDNSName
Write-host $env:KUBPubKey
Write-host $env:KUBUsername
Write-host $env:KUBVMSize
Write-host $env:KUBNodesQTY
Write-host $env:KUBmasterDnsNamePrefix
Write-host $env:KUBagentDnsNamePrefix

Write-Output  ("##vso[task.setvariable variable=subscriptionID]$subscriptionID")
Write-Output  ("##vso[task.setvariable variable=OMSRGName]$OMSRGName")
Write-Output  ("##vso[task.setvariable variable=OMSName]$OMSName")
Write-Output  ("##vso[task.setvariable variable=OMSLocation]$OMSLocation")
Write-Output  ("##vso[task.setvariable variable=KUBRGName]$KUBRGName")
Write-Output  ("##vso[task.setvariable variable=KUBClusterName]$KUBClusterName")
Write-Output  ("##vso[task.setvariable variable=KUBLocation]$KUBLocation")
Write-Output  ("##vso[task.setvariable variable=KUBDNSName]$KUBDNSName")
Write-Output  ("##vso[task.setvariable variable=KUBPubKey]$KUBPubKey")
Write-Output  ("##vso[task.setvariable variable=KUBUsername]$KUBUsername")
Write-Output  ("##vso[task.setvariable variable=KUBVMSize]$KUBVMSize")
Write-Output  ("##vso[task.setvariable variable=KUBNodesQTY]$KUBNodesQTY")
Write-Output  ("##vso[task.setvariable variable=KUBmasterDnsNamePrefix]$KUBmasterDnsNamePrefix")
Write-Output  ("##vso[task.setvariable variable=KUBagentDnsNamePrefix]$KUBagentDnsNamePrefix")

Write-host $env:OMSRGName
Write-host $env:OMSName
Write-host $env:OMSLocation
Write-host $env:KUBRGName
Write-host $env:KUBClusterName
Write-host $env:KUBLocation
Write-host $env:KUBDNSName
Write-host $env:KUBPubKey
Write-host $env:KUBUsername
Write-host $env:KUBVMSize
Write-host $env:KUBNodesQTY
Write-host $env:KUBmasterDnsNamePrefix
Write-host $env:KUBagentDnsNamePrefix

Write-host $OMSRGName
Write-host $OMSName
Write-host $OMSLocation
Write-host $KUBRGName
Write-host $KUBClusterName
Write-host $KUBLocation
Write-host $KUBDNSName
Write-host $KUBPubKey
Write-host $KUBUsername
Write-host $KUBVMSize
Write-host $KUBNodesQTY
Write-host $KUBmasterDnsNamePrefix
Write-host $KUBagentDnsNamePrefix
