Set-Location ..\database

Write-Host "=========================================="
Write-Host "Copiando arquivo dump para o banco de dados... A operação pode levar alguns minutos"
Write-Host "=========================================="

docker cp ./sagerdumpv8.tar postgres:/

Write-Host "=========================================="
Write-Host "Iniciando restauração"
Write-Host "=========================================="


docker container exec -it postgres pg_restore -h localhost -p 5432 -U postgres --dbname=platform_domain_schema --schema=entities -F tar -v sagerdumpv8.tar

Set-Location ..\scripts