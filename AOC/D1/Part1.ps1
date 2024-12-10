$inputlist = New-Object Collections.Generic.List[String]
$leftlist = New-Object Collections.Generic.List[String]
$rightlist = New-Object Collections.Generic.List[String]
foreach($line in Get-Content .\input.txt) {
        $inputlist.Add($line) 
    }
foreach($s in $inputlist) {
        $a,$b = $s -split "   "
        $leftlist.Add($a)
        $rightlist.Add($b)
    }

$result = 0
foreach ($s in $inputlist) {
$minl = $leftlist[0]
$minr = $rightlist[0]
    foreach ($i in $leftlist) {
        if ($i -lt $minl) {
            $minl = $i
        }
    }
    foreach ($i in $rightlist) {
        if ($i -lt $minr) {
            $minr = $i
        }
    }
    if ($minl -le $minr) {
        $result += ($minr-$minl)
    } else {
        $result += ($minl-$minr)
    }
    $leftlist.Remove($minl)

    $rightlist.Remove($minr)
}
Write-Host $result