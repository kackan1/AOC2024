$inputlist = New-Object Collections.Generic.List[String]
foreach($line in Get-Content .\input.txt) {
    $inputlist.Add($line)
}
$result=0
foreach($line in $inputlist){
    $linearray = $line.Split(" ")
    [bool]$risinglowering = $true
    [bool]$jumps = $true
    if ([int]$linearray[0] -lt [int]$linearray[1]){
    #rising
        for ($i = 1; $i -lt $linearray.Length; $i++){       
            if ([int]$linearray[$i-1] -lt [int]$linearray[$i]) {
                if ((([int]$linearray[$i]-[int]$linearray[$i-1]) -gt 0) -and (([int]$linearray[$i]-[int]$linearray[$i-1]) -lt 4)){
                    
                } else {
                    $jumps=$false
                }
            } else {
                $risinglowering=$false
            }
        }
    } elseif ([int]$linearray[0] -gt [int]$linearray[1]){
    #lowering
        for ($i = 1; $i -lt $linearray.Length; $i++){       
            if ([int]$linearray[$i-1] -gt [int]$linearray[$i]) {
                if ((([int]$linearray[$i-1]-[int]$linearray[$i]) -gt 0) -and (([int]$linearray[$i-1]-[int]$linearray[$i]) -lt 4)){
                    
                } else {
                    $jumps=$false
                }
            } else {
                $risinglowering=$false
            }
        }
    } else {
        $risinglowering = $false
    }
    Write-Host $risinglowering "   " $jumps
    Write-Host $line
    if ($risinglowering -and $jumps) {
        $result++
    } else {
    }
}
Write-Host $result