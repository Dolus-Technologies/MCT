# ------------------------------------------------------------------
# Clean up resources
# ------------------------------------------------------------------

Clear-Host

$RGs = Get-AzResourceGroup

foreach($rg in $RGs) {
    if ($rg.Tags -eq $null -or $rg.Tags["Persist"] -ne "Yes") { 
        Write-Host "Deleting Resource Group: " $rg.ResourceGroupName "..."
        Remove-AzResourceGroup -Id $rg.ResourceId -Force -AsJob
    }
}
