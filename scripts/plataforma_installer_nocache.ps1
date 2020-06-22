Set-Location ./helpers

$helpers_path = Get-Location

Set-Location ../../plataforma_services

Set-Location plataforma-installer

docker-compose down
docker-compose build --no-cache 
docker network rm plataforma_network 
docker volume rm plataforma-installer_pgdata
docker network create plataforma_network 
docker-compose up -d

Set-Location ../sager.domain.fabrica/sager
$Env:sager_domain_path = Get-Location


Set-Location ../../platform_deploy
$Env:platform_deploy_path = Get-Location

pipenv --three
pip install pipenv
pipenv run pip install pypiwin32
pipenv install

pipenv run powershell.exe -File $helpers_path\create_entities.ps1


Set-Location ../../scripts
