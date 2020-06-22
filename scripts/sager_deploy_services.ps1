Set-Location ./helpers

$helpers_path = Get-Location

Set-Location ../../publish

$Env:sager_publish_path = Get-Location

Set-Location ../plataforma_services/platform_deploy

$Env:platform_deploy_path = Get-Location

pipenv install;
pipenv run powershell.exe -File $helpers_path\deploy_services.ps1;

Set-Location ../../scripts