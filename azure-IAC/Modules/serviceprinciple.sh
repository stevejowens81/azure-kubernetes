#!/bin/bash
# subsciptionID="Default"
# KUBRGName="Default-RG"
# KUBLocation="West Europe"

subsciptionID="149ec02b-dd91-4520-865e-c116832e8b64"
KUBRGName="BJSS-DEMO-ACS-RG"
KUBLocation="West Europe"

az account set --subscription $subsciptionID
az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/$subsciptionID/resourceGroups/$KUBRGName"