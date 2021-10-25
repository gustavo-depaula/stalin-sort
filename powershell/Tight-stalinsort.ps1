function Convert-StalinSort {
    param(
        [Parameter(Mandatory=$true)][Int32[]]$Inputarray
    )
    [int32[]]$Output = @()
    $Inputarray |%{if($_ -ge $output[-1]){$Output += $_}}
    $Output
}

Convert-StalinSort -Input @(1, 2, 4, 3, 6, 8, 0, 8, 9, 5, 7)