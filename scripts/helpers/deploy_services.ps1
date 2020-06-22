Set-Location $Env:sager_publish_path


foreach ($repo in get-ChildItem $Env:sager_publish_path\*) {
    Write-Host "=========================================="
    Write-Host "Deploying: "$repo
    Write-Host "=========================================="

    Set-Location $repo

    python $Env:platform_deploy_path\main.py --build --environment tst --platform docker
    python $Env:platform_deploy_path\main.py --register_schema --environment tst --platform docker

    Set-Location ..

    Write-Host "=========================================="
}



$repos = (
"sager.baseconsulta.manter.fabrica.radix",
"sager.calculo.api.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Deploying: "$repo
    Write-Host "=========================================="

    Set-Location $repo 

    python $Env:platform_deploy_path\main.py --build --environment tst --platform docker
    python $Env:platform_deploy_path\main.py --register_schema --environment tst --platform docker  
    python $Env:platform_deploy_path\main.py  --run_presentation --environment tst --platform docker
    
    Set-Location ..

    Write-Host "=========================================="
}

