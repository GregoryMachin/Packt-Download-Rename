$files = Get-ChildItem -Path "c:\temp\books" *.* | where { ! $_.PSIsContainer }
 
# enumerate the items array
foreach ($File in $Files){
if ($File.Name -like "*-*"){
    $PDF = $File.Name
    $number,$Name = $File.Name.split('-')
    #Write-host "Number:" $number "Name :" $Name
    Write-host "------------------------------------------------------"
    Write-Host "New PDF Name" "c:\temp\books\$Name" -BackgroundColor DarkGreen
    Write-host "------------------------------------------------------"
    Rename-Item "c:\temp\books\$PDF" "c:\temp\books\$Name"
    Foreach ($File in $Files){
        if ($File.Name -like "*_*"){
            $Zip = $File.Name
           $CodeNumber,$CodeName = $File.Name.split('_')
           If ($CodeNumber -eq $number){
           #Write-host "Code Number:" $CodeNumber "Name :" $CodeName 
           #Write-host "Summary :" $PDF " | " $Zip
           $NoEtention = [io.path]::GetFileNameWithoutExtension("$Name")
           Write-host "------------------------------------------------------"
           Write-Host "New Zip Name" "c:\temp\books\$NoEtention-$CodeName" -BackgroundColor DarkGreen
           Write-host "------------------------------------------------------"
           Rename-Item "c:\temp\books\$Zip" "c:\temp\books\$NoEtention-$CodeName"
           Break 
           }
        }
    }
    
}
}