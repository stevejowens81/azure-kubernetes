# Requires -Version 3.0
# Content Version : 2018.02.08.001
# Creator - Steve Owens
<#
 .SYNOPSIS
    Deploy a full MS Azure ACS (Kubernetes Cluster)

 .DESCRIPTION
    x

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
    [string] $KUBagentDnsNamePrefix= $KUBDNSName + 'agents',
    [string] $TemplateFile = 'kubernetes-deploy.json',
    [string] $TemplateParametersFile = 'kubernetes-deploy-serviceprincipal-params.json',
    [switch] $ValidateOnly
)

$ErrorActionPreference = 'Stop'
Set-StrictMode -Version 3

function Format-ValidationOutput {
    param ($ValidationOutput, [int] $Depth = 0)
    Set-StrictMode -Off
    return @($ValidationOutput | Where-Object { $_ -ne $null } | ForEach-Object { @('  ' * $Depth + ': ' + $_.Message) + @(Format-ValidationOutput @($_.Details) ($Depth + 1)) })
}

$OptionalParameters = New-Object -TypeName Hashtable
$TemplateFilePath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, $TemplateFile))
$TemplateParametersFilePath = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, $TemplateParametersFile))

# Create or update the resource group using the specified template files and template parameters files
New-AzureRmResourceGroup -Name $KUBRGName -Location $OMSLocation -Verbose -Force

if ($ValidateOnly) {
    $ErrorMessages = Format-ValidationOutput (Test-AzureRmResourceGroupDeployment -ResourceGroupName $KUBRGName `
                                                                                  -TemplateFile $TemplateFilePath `
                                                                                  -TemplateParameterFile $TemplateParametersFilePath `
                                                                                  -resourceName $KUBClusterName `
                                                                                  -masterDnsNamePrefix $KUBmasterDnsNamePrefix `
                                                                                  -agentDnsNamePrefix $KUBagentDnsNamePrefix `
                                                                                  -agentCount $KUBNodesQTY `
                                                                                  -agentVMSize $KUBVMSize `
                                                                                  -linuxAdminUsername $KUBUsername `
                                                                                  -windowsAgentAdminUsername $KUBUsername `
                                                                                  -sshRSAPublicKey $KUBPubKey `
																				  @OptionalParameters)
    if ($ErrorMessages) {
        Write-Output '', 'Validation returned the following errors:', @($ErrorMessages), '', 'Template is invalid.'
    }
    else {
        Write-Output '', 'Template is valid.'
    }
}
else {
    New-AzureRmResourceGroupDeployment -Name ((Get-ChildItem $TemplateFile).BaseName + '-' + ((Get-Date).ToUniversalTime()).ToString('MMdd-HHmm')) `
                                                                                -ResourceGroupName $KUBRGName `
                                                                                -TemplateFile $TemplateFilePath `
                                                                                -TemplateParameterFile $TemplateParametersFilePath `
                                                                                -resourceName $KUBClusterName `
                                                                                -masterDnsNamePrefix $KUBmasterDnsNamePrefix `
                                                                                -agentDnsNamePrefix $KUBagentDnsNamePrefix `
                                                                                -agentCount $KUBNodesQTY `
                                                                                -agentVMSize $KUBVMSize `
                                                                                -linuxAdminUsername $KUBUsername `
                                                                                -windowsAgentAdminUsername $KUBUsername `
                                                                                -sshRSAPublicKey $KUBPubKey `
                                                                              @OptionalParameters `
                                                                                -Force -Verbose `
                                                                                -ErrorVariable ErrorMessages
    if ($ErrorMessages) {
        Write-Output '', 'Template deployment returned the following errors:', @(@($ErrorMessages) | ForEach-Object { $_.Exception.Message.TrimEnd("`r`n") })
    }
}
