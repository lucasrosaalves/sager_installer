Remove-Item -Recurse -Force .\plataforma_services -ErrorAction Ignore

mkdir .\plataforma_services
cd .\plataforma_services

pip install pypiwin32

git clone --branch reprocess https://github.com/onsbr/plataforma-installer.git

git clone --branch master https://github.com/onsplatform/platform_deploy

git clone --branch develop https://onsvsts@dev.azure.com/onsvsts/sager/_git/sager.domain.fabrica


cd Plataforma-Installer
$Env:plataforma_instaler_path = Get-Location

docker-compose down
#docker-compose build --no-cache 
docker network rm plataforma_network 
docker volume rm plataforma-installer_pgdata
docker network create plataforma_network 
docker-compose up -d

cd ..

cd sager.domain.fabrica
$Env:sager_domain_path = Get-Location

cd ..

cd platform_deploy
$Env:platform_deploy_path = Get-Location

pipenv --three
pipenv install
pipenv shell

pipenv run cd $Env:sager_domain_path\sager

pipenv run python $Env:platform_deploy_path\main.py --create_entities --environment tst --platform docker

# cd ..
# cd .. 
# cd .. 

# docker cp ./sagerdumpv8.tar postgres:/
# docker container exec -it postgres pg_restore -h localhost -p 5432 -U postgres --dbname=platform_domain_schema --schema=entities -F tar -v sagerdumpv8.tar