function Invoke-StalinSort {
    [CmdletBinding()]
    [OutputType([Int32[]])]
    param(
        [Parameter(Mandatory=$true)]
        [Int32[]]
        $Array
    )

    $high = $null
    $result = @()

    foreach ($item in $Array) {
        if (($null -eq $high) -or ($item -ge $high)) {
            $high = $item
            $result += $item
        }
    }

    $result
}

(Invoke-StalinSort @(1, 2, 4, 3, 6, 8, 0, 8, 9, 5, 7)) -join ','
