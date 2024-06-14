$Folder = 'C:\ProgramData\chocolatey'
"Testing if folder [$Folder]  exists"
if (Test-Path -Path $Folder) {
    "$Folder path exists. Not installing Chocolatey"
} else {
    "$Folder path doesn't exist. Installing Chocolatey"
    Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
}