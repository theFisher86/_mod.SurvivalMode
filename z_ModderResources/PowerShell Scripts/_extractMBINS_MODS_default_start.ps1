param($startfolder="c:\")
$mbincompiler = ""
Function Get-Folder($initialDirectory)

{
    [System.Reflection.Assembly]::LoadWithPartialName("System.windows.forms")

    $foldername = New-Object System.Windows.Forms.FolderBrowserDialog
    $foldername.SelectedPath = $startfolder

    if($foldername.ShowDialog() -eq "OK")
    {
        $folder += $foldername.SelectedPath
    }
    return $folder
}

Function Show-MsgBox ($Text,$Title="",[Windows.Forms.MessageBoxButtons]$Button = "OK",[Windows.Forms.MessageBoxIcon]$Icon="Information"){
[Windows.Forms.MessageBox]::Show("$Text", "$Title", [Windows.Forms.MessageBoxButtons]::$Button, $Icon) | ?{(!($_ -eq "OK"))}
}
echo "Select the top level folder containing all the mbin files."
echo "This will decompile all of the mbin files recursively."
echo "Please note you need to have already unpacked all the PSARC files.  Use QuickUnpack to do so."
$pcbanks = Get-Folder
# If((Show-MsgBox -Title 'Rename newly created files?' -Text 'I can change the file extension of all the newly creted files to file.exml.orig to help keep track of your changes.  Would you like me to do that?' -Button YesNo -Icon Warning) -eq 'Yes')
	# {
		# $renameFiles = "yes"
	# }

#[System.Windows.Forms.MessageBox]::Show($pcbanks) 
echo "Extracting all mbins"
 $Files = Get-Childitem $pcbanks "*.mbin" -Recurse
 foreach($File in $Files)
{
    .\MBINCompiler.exe.lnk $file.Fullname
}
[System.Windows.Forms.MessageBox]::Show("All Done.") 
