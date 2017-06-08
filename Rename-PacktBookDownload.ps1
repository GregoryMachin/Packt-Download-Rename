$files = Get-ChildItem -Path "c:\temp\books" *.* | where { ! $_.PSIsContainer }
 
#Loop though all the files in the array.
foreach ($File in $Files){
if ($File.Name -like "*-*"){ #the Code files can be identified by the "-" character.
    $PDF = $File.Name
    $number,$Name = $File.Name.split('-')
    #Write-host "Number:" $number "Name :" $Name
    Write-host "------------------------------------------------------"
    Write-Host "New PDF Name" "c:\temp\books\$Name" -BackgroundColor DarkGreen
    Write-host "------------------------------------------------------"
    # Rename the pfd file removing the long number
    Rename-Item "c:\temp\books\$PDF" "c:\temp\books\$Name"
    #loop though all the files to try and find a matching code file.
    Foreach ($File in $Files){
        if ($File.Name -like "*_*"){ # the Code files can be identified by the "_" character. 
            $Zip = $File.Name 
           # Slit the name on the "_" character as we need to extract the number for matching with the number from the PDF
           $CodeNumber,$CodeName = $File.Name.split('_')
           If ($CodeNumber -eq $number){ # if the number from the pdf matchs the number from the code file the rename the code file with the name from the pdf.
           $NoExtention = [io.path]::GetFileNameWithoutExtension("$Name")
           Write-host "------------------------------------------------------"
           Write-Host "New Zip Name" "c:\temp\books\$NoEtention-$CodeName" -BackgroundColor DarkGreen
           Write-host "------------------------------------------------------"
           # Rename the code file removing the long number and adding the name from the pdf
           Rename-Item "c:\temp\books\$Zip" "c:\temp\books\$NoExtention-$CodeName"
           #If we have a match there is no need to process any further files as there should only be one code file.
           Break 
           }
        }
    }
    
}
}