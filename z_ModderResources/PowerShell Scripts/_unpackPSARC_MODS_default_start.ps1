param($startfolder="c:\")
Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.SelectedPath = "S:\Game Mods\No Mans Sky\Mods"

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

Function Show-MsgBox ($Text,$Title="",[Windows.Forms.MessageBoxButtons]$Button = "OK",[Windows.Forms.MessageBoxIcon]$Icon="Information"){
[Windows.Forms.MessageBox]::Show("$Text", "$Title", [Windows.Forms.MessageBoxButtons]::$Button, $Icon) | ?{(!($_ -eq "OK"))}
}
echo "Select the top level folder containing all the psarc files."
echo "This will unpack all of the psarc files recursively."
$pcbanks = Get-Folder
# If((Show-MsgBox -Title 'Rename newly created files?' -Text 'I can change the file extension of all the newly creted files to file.exml.orig to help keep track of your changes.  Would you like me to do that?' -Button YesNo -Icon Warning) -eq 'Yes')
	# {
		# $renameFiles = "yes"
	# }

#[System.Windows.Forms.MessageBox]::Show($pcbanks) 
echo "Extracting all psarc files"
 $Files = Get-Childitem $pcbanks "*.pak" -Recurse
 foreach($File in $Files)
{
    .\PSArcTool.exe.lnk $file.Fullname
}
echo "Complete"
#[System.Windows.Forms.MessageBox]::Show("All Done.") 

#If((Show-MsgBox -Title 'Decompile Mbins?' -Text 'Would you like to decompile the mbins for the newly extracted psarcs now?' -Button YesNo -Icon Warning) -eq 'Yes')
#    {
#        echo $files.DirectoryName
#        invoke-expression ".\extract_all_mbins_with_folder_choose.ps1 S:\Game Mods\No Mans Sky\Mods"
#    }
