Configuration EnvironmentConfig
{
    Import-DscResource -ModuleName PSDesiredStateConfiguration

    xScript InstallSoftwares {
      GetScript = {
      }
      TestScript = { 
      }
      SetScript = {
        # Source file location
        $source = 'https://adpsamuazsax001.blob.core.windows.net/data/UnityHubSetup.exe?sp=r&st=2022-03-08T12:39:50Z&se=2023-06-09T20:39:50Z&sv=2020-08-04&sr=b&sig=kW%2F8ii3bpUVr3zGP%2FG4L62czugvxb8p8o0glXO5UgW0%3D'
        # Destination to save the file
        New-Item -Path 'c:\temp' -ItemType Directory
        $destination = 'c:\temp\UnityHubSetup.exe'
        #Download the file
        Invoke-WebRequest -Uri $source -OutFile $destination
        Start-Sleep -Seconds 120
        Set-Location -Path c:\temp
        .\UnityHubSetup.exe /S /D=C:\Development\Unity
      }
    }
}
