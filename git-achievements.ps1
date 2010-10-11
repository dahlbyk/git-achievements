function Find-Program($folderName)
{
    $p1 = "C:\Program Files\$folderName"
    if(!(test-path $p1))
    {
        $p2 = "C:\Program Files (x86)\$folderName"
        
        if(!(test-path $p2))
        {
            Write-Warning "Could not find program folder/path in either $p1 or $p2"
        }
        else
        {
            $p2
        }
    }
    else
    {
        $p1
    }
}


$pathBackup = $Env:Path
$Env:Path = "/bin;$Env:Path"
$gaDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
echo $gaDir
&  (Find-Program 'Git\bin\sh.exe') "$gaDir\git-achievements" $args
$Env:Path = $pathBackup
