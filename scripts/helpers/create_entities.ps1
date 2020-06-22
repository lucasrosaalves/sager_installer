#Set-Location C:\Projetos\sager_installer\plataforma_services\sager.domain.fabrica\sager

Set-Location $Env:sager_domain_path

Write-Host "Env:sager_domain_path: " $Env:sager_domain_path
Write-Host "Env:platform_deploy_path: " $Env:platform_deploy_path

python $Env:platform_deploy_path\main.py --create_entities --environment tst --platform docker