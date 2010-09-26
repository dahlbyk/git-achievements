$pathBackup = $Env:Path
$Env:Path = "/bin;$Env:Path"
$gaDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
& $Env:ProgramFiles\Git\bin\sh.exe "$gaDir\git-achievements" $args
$Env:Path = $pathBackup
