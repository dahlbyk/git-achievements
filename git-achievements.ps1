
$pathBackup = $Env:Path
$Env:Path = "/bin;$Env:Path"
$gaDir = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

$gitX = [Environment]::GetEnvironmentVariable("gitAchievementsGitPath", "User");
if(! $gitX)
{
	
	$gitX = (get-command sh).definition
	[Environment]::SetEnvironmentVariable("gitAchievementsGitPath", $gitX, "User")
}

&  $gitX "$gaDir\git-achievements" $args
$Env:Path = $pathBackup

