Set-Location $Env:sager_domain_path

python $Env:platform_deploy_path\main.py --create_entities --environment tst --platform docker