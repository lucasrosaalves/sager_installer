#region plataforma_services  

Set-Location ./plataforma_services  

$repos = (
"plataforma-installer",
"platform_deploy",
"sager.domain.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Updating the repository: "$repo
    Write-Host "=========================================="

    Set-Location ./$repo 
    git pull
    Set-Location ..
}

Set-Location ..

#endregion 


#region sager_services 


Set-Location ./sager_services  

$repos = (
"sager.calculo.util.fabrica",
"sager.calculo.uge.fabrica",
"sager.calculo.usina.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Updating the repository: "$repo
    Write-Host "=========================================="

    Set-Location ./$repo 
    git pull
    Set-Location ..
}


#presentations

Set-Location ./presentations

$repos = (
"sager.baseconsulta.manter.fabrica.radix",
"sager.calculo.api.fabrica",
"sager.calculo.frontend.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Updating the repository: "$repo
    Write-Host "=========================================="

    Set-Location ./$repo 
    git pull
    Set-Location ..
}

Set-Location ..

#taxas

Set-Location ./taxas

$taxas_path = Get-Location

$repos = (
"sager.calculo.indice.indisponibilidade.fabrica",
"sager.calculo.taxa.teifa.acum.fabrica",
"sager.calculo.taxa.teifa.fabrica",
"sager.calculo.taxa.teifa.fc.fabrica",
"sager.calculo.taxa.teifa.ind.fabrica",
"sager.calculo.taxa.teifa.oper.fabrica",
"sager.calculo.taxa.teip.acum.fabrica",
"sager.calculo.taxa.teip.fabrica",
"sager.calculo.taxa.teip.fc.fabrica",
"sager.calculo.taxa.teip.ind.fabrica",
"sager.calculo.taxa.teip.oper.fabrica")

foreach($repo in $repos) {

    $folder_1 = $repo + "_1.0.0"
    $path_1 = Join-Path -Path $taxas_path -ChildPath $folder_1
    
    if (Test-Path -Path $path_1) {

        Write-Host "=========================================="
        Write-Host "Updating the repository: "$folder_1
        Write-Host "=========================================="

        Set-Location ./$folder_1
        git pull    
        Set-Location ..
    }

    $folder_2 = $repo + "_2.0.0"
    $path_2 = Join-Path -Path $taxas_path -ChildPath $folder_2
        
    if (Test-Path -Path $path_2) {

        Write-Host "=========================================="
        Write-Host "Updating the repository: "$folder_2
        Write-Host "=========================================="

        Set-Location ./$folder_2
        git pull    
        Set-Location ..
    }
}

Set-Location ..


#parametros

Set-Location ./parametros

$parametros_path = Get-Location

$repos = (
"sager.calculo.parametro.hdce.fabrica",
"sager.calculo.parametro.hdf.fabrica",
"sager.calculo.parametro.hdp.fabrica",
"sager.calculo.parametro.hedf.fabrica",
"sager.calculo.parametro.hedp.fabrica",
"sager.calculo.parametro.hp.fabrica",
"sager.calculo.parametro.hrd.fabrica",
"sager.calculo.parametro.hs.fabrica",
"sager.calculo.parametro.hdce.opfc.fabrica",
"sager.calculo.parametro.hdf.opfc.fabrica",
"sager.calculo.parametro.hdp.opfc.fabrica",
"sager.calculo.parametro.hedf.opfc.fabrica",
"sager.calculo.parametro.hedp.opfc.fabrica",
"sager.calculo.parametro.hrd.opfc.fabrica",
"sager.calculo.parametro.hs.opfc.fabrica"
)

foreach($repo in $repos) {

    $folder_1 = $repo + "_1.0.0"
    $path_1 = Join-Path -Path $parametros_path -ChildPath $folder_1
    
    if (Test-Path -Path $path_1) {

        Write-Host "=========================================="
        Write-Host "Updating the repository: "$folder_1
        Write-Host "=========================================="

        Set-Location ./$folder_1
        git pull    
        Set-Location ..
    }

    $folder_2 = $repo + "_2.0.0"
    $path_2 = Join-Path -Path $parametros_path -ChildPath $folder_2
        
    if (Test-Path -Path $path_2) {

        Write-Host "=========================================="
        Write-Host "Updating the repository: "$folder_2
        Write-Host "=========================================="

        Set-Location ./$folder_2
        git pull    
        Set-Location ..
    }

    $folder_3 = $repo + "_3.0.0"
    $path_3 = Join-Path -Path $parametros_path -ChildPath $folder_3
        
    if (Test-Path -Path $path_3) {

        Write-Host "=========================================="
        Write-Host "Updating the repository: "$folder_3
        Write-Host "=========================================="

        Set-Location ./$folder_3
        git pull    
        Set-Location ..
    }
}

Set-Location ..
Set-Location ..

#endregion 