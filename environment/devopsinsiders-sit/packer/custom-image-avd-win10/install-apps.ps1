Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
cinst vscode -y
cinst googlechrome -y
cinst git -y
cinst gittfs -y
choco install -y python3
choco install -y javaruntime
choco install -y postman
choco install -y wiremockui
choco install -y beyondcompare
choco install -y cypress
choco install -y nodejs.install
choco install -y intellijidea
choco install -y pycharm
choco install -y firefox
choco upgrade -y officeproplus2013