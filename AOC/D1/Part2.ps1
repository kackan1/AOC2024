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
foreach ($l in $leftlist) {
$similarity=0
    foreach ($r in $rightlist){
        if($l -eq $r){
            $similarity++
        }
    }
$result = $result + ([int]$l*$similarity)
}
Write-Host $result