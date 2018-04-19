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
    [string] [Parameter(Mandatory=$true)] $OMSName,
    [string] [Parameter(Mandatory=$true)] $KUBClusterName,
	[string] [Parameter(Mandatory=$true)] $KUBLocation,
    [string] [Parameter(Mandatory=$true)] $OMSLocation,
    [string] $OMSRGName = $OMSName + '-RG',
    [string] $KUBRGName = $KUBClusterName + '-RG',
    [string] $TmpOMS = 'oms-deploy.json',
    [string] $TmpConMon = 'conmonoms-deploy.json',
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
$TmpOMS1 = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, $TmpOMS))
$TmpConMon1 = [System.IO.Path]::GetFullPath([System.IO.Path]::Combine($PSScriptRoot, $TmpConMon1))


# Create or update the resource group using the specified template files and template parameters files
New-AzureRmResourceGroup -Name $OMSRGName -Location $OMSLocation -Verbose -Force

if ($ValidateOnly) {
    $ErrorMessages = Format-ValidationOutput (Test-AzureRmResourceGroupDeployment -ResourceGroupName $OMSRGName `
                                                                                  -TemplateFile $TmpOMS1 `
                                                                                  -OMSName $OMSName `
																				  -OMSLocation $OMSLocation `
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
                                                                                -ResourceGroupName $OMSRGName `
                                                                                -TemplateFile $TmpConMon1 `
                                                                                -OMSName $OMSName `
                                                                                -OMSLocation $OMSLocation `
                                                                                @OptionalParameters `
                                                                                -Force -Verbose `
                                                                                -ErrorVariable ErrorMessages
    if ($ErrorMessages) {
        Write-Output '', 'Template deployment returned the following errors:', @(@($ErrorMessages) | ForEach-Object { $_.Exception.Message.TrimEnd("`r`n") })
    }
}
if ($ValidateOnly) {
    $ErrorMessages = Format-ValidationOutput (Test-AzureRmResourceGroupDeployment -ResourceGroupName $OMSRGName `
                                                                                  -TemplateFile $TmpOMS `
                                                                                  -OMSName $OMSName `
																				  -OMSLocation $OMSLocation `
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
                                                                                -ResourceGroupName $OMSRGName `
                                                                                -TemplateFile $TmpOMS `
                                                                                -OMSName $OMSName `
                                                                                -OMSLocation $OMSLocation `
                                                                                @OptionalParameters `
                                                                                -Force -Verbose `
                                                                                -ErrorVariable ErrorMessages
    if ($ErrorMessages) {
        Write-Output '', 'Template deployment returned the following errors:', @(@($ErrorMessages) | ForEach-Object { $_.Exception.Message.TrimEnd("`r`n") })
    }
}