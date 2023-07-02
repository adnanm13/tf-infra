param(
    [Parameter(Mandatory=$true)][string]$username,
    [Parameter(Mandatory=$true)][string]$password
)

## Mount Additional Disk
Get-Disk | Where partitionstyle -eq 'raw' | Initialize-Disk -PartitionStyle MBR -PassThru | New-Partition -UseMaximumSize -DriveLetter F | Format-Volume -FileSystem NTFS -NewFileSystemLabel 'data' -Confirm:$true

## Set UK Timezone
Set-TimeZone -Id "GMT Standard Time"

## Set Keyboard Layout
Set-WinUserLanguageList en-GB,en-US -Force


## Ansible Configuration
Set-MpPreference -DisableRealtimeMonitoring $true
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows Defender" -Name DisableAntiSpyware -Value 1 -PropertyType DWORD -Force
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*" -Force
netsh advfirewall firewall add rule name='PSRemoting HTTP' dir=in action=allow protocol=TCP localport=5985
netsh advfirewall firewall add rule name='PSRemoting HTTPS' dir=in action=allow protocol=TCP localport=5986

## Ansible Policy Update
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name AllowAutoConfig -Value 1 -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name AllowBasic -Value 1 -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service" -Name AllowUnencryptedTraffic -Value 1 -Force
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS" -Name AllowRemoteShellAccess -Value 1 -Force

## Ansible Policy Update
# Remove-Item -Path WSMan:\localhost\Listener\* -Recurse -Force
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$url = "https://raw.githubusercontent.com/ansible/ansible/devel/examples/scripts/ConfigureRemotingForAnsible.ps1"
$file = "$env:temp\ConfigureRemotingForAnsible.ps1"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe -ExecutionPolicy ByPass -File $file --Verbose
Set-Service -Name "WinRM" -StartupType Automatic


## Python Installation
$url = "https://www.python.org/ftp/python/3.8.8/python-3.8.8-amd64.exe"
$file = "$env:temp\python-3.10.8.exe"
(New-Object -TypeName System.Net.WebClient).DownloadFile($url, $file)
powershell.exe $file /quiet InstallAllUsers=1 PrependPath=1 Include_test=0


## Domain Join
Add-Content -Path $env:windir\System32\drivers\etc\hosts -Value "`n10.0.3.6`tdevopsinsiderssit.local" -Force
$InterfaceIndex = (Get-NetAdapter -Name "Ethernet 2").ifIndex
$InterfaceIndex1 = (Get-NetAdapter -Name "Ethernet").ifIndex

Set-DNSClientServerAddress -InterfaceIndex $InterfaceIndex -ServerAddresses 10.0.3.6
Set-DNSClientServerAddress -InterfaceIndex $InterfaceIndex1 -ServerAddresses 10.0.3.6

$SecureString = ConvertTo-SecureString -AsPlainText "$password" -Force
$MySecureCreds = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $username,$SecureString
Add-Computer -DomainName "devopsinsiderssit.local" -Credential $MySecureCreds

#Give Access to RDP Users
#Add-LocalGroupMember -Group 'Remote Desktop Users' -Member 'devopsinsidersSOLIRIUS\\griffnose VM USERS'
