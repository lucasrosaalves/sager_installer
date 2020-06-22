
cd ..\sager.domain.fabrica\sager

python C:\Projetos\ONS\platform_deploy\main.py --create_entities --environment tst --platform docker

cd ..
cd .. 

docker cp ./sagerdumpv8.tar postgres:/
docker container exec -it postgres pg_restore -h localhost -p 5432 -U postgres --dbname=platform_domain_schema --schema=entities -F tar -v sagerdumpv8.tar