param ($TemplatePackRoot, $ScriptRoot)

try 
{
    Write-Host "Begin Project Templates Nuget pack ..."

    $nugetOutputDirectory = "$($TemplatePackRoot)\Templates"
    $nugetFileName = "$($ScriptRoot)\nuget.exe"

    if (!(Test-Path $nugetFileName))
    {
        Write-Host "Downloading Nuget.exe ..."
        Invoke-WebRequest -Uri "https://dist.nuget.org/win-x86-commandline/latest/nuget.exe" -OutFile $nugetFileName
        Write-Host "Downloading Nuget.exe complete"
    }

    $wpfNuspecPath = "$($ScriptRoot)\Wpf\Prism.Wpf.Templates.nuspec"
    $xfNuspecPath = "$($ScriptRoot)\Xamarin.Forms\Prism.Xamarin.Forms.Templates.nuspec"

    Invoke-Expression "$($nugetFileName) pack $($wpfNuspecPath) -OutputDirectory $($nugetOutputDirectory)" 

    Invoke-Expression "$($nugetFileName) pack $($xfNuspecPath) -OutputDirectory $($nugetOutputDirectory)" 

    Write-Host "Completed Project Templates Nuget pack ..."
}
catch 
{
    Write-Host $ErrorMessage = $_.Exception.Message
	exit 1
}