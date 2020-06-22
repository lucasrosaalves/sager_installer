Set-Location ..

$installer_path = Get-Location
$publish_path = Join-Path -Path $installer_path -ChildPath "\publish"

Remove-Item .\publish -Recurse -ErrorAction Ignore

Set-Location ./sager_services  

$repos = (
"sager.calculo.uge.fabrica",
"sager.calculo.usina.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Build: "$repo
    Write-Host "=========================================="

    Set-Location ./$repo 

    dotnet restore
    dotnet publish -c Release --output $publish_path/$repo
    Copy-Item Mapa $publish_path/$repo
    Copy-Item Mapa/*.yaml $publish_path/$repo/Mapa
    Copy-Item Metadados $publish_path/$repo
    Copy-Item Metadados/*.yaml $publish_path/$repo/Metadados
    Copy-Item Dockerfile $publish_path/$repo
    Copy-Item plataforma.json $publish_path/$repo
    Set-Location ..

    Write-Host "=========================================="


}


#presentations

Set-Location ./presentations

$repos = (
"sager.baseconsulta.manter.fabrica.radix",
"sager.calculo.api.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Build: "$repo
    Write-Host "=========================================="

    Set-Location ./$repo 

    dotnet restore
    dotnet publish -c Release --output $publish_path/$repo
    Copy-Item Mapa $publish_path/$repo
    Copy-Item Mapa/*.yaml $publish_path/$repo/Mapa
    Copy-Item Metadados $publish_path/$repo
    Copy-Item Metadados/*.yaml $publish_path/$repo/Metadados
    Copy-Item Dockerfile $publish_path/$repo
    Copy-Item plataforma.json $publish_path/$repo
    Set-Location ..

    Write-Host "=========================================="
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
        Write-Host "Build: "$folder_1
        Write-Host "=========================================="

        Set-Location ./$folder_1

        dotnet restore
        dotnet publish -c Release --output $publish_path/$folder_1
        Copy-Item Mapa $publish_path/$folder_1
        Copy-Item Mapa/*.yaml $publish_path/$folder_1/Mapa
        Copy-Item Metadados $publish_path/$folder_1
        Copy-Item Metadados/*.yaml $publish_path/$folder_1/Metadados
        Copy-Item Dockerfile $publish_path/$folder_1
        Copy-Item plataforma.json $publish_path/$folder_1
        Set-Location ..
    
        Write-Host "=========================================="
    }

    $folder_2 = $repo + "_2.0.0"
    $path_2 = Join-Path -Path $taxas_path -ChildPath $folder_2
        
    if (Test-Path -Path $path_2) {

        Write-Host "=========================================="
        Write-Host "Build: "$folder_2
        Write-Host "=========================================="

        Set-Location ./$folder_2

        dotnet restore
        dotnet publish -c Release --output $publish_path/$folder_2
        Copy-Item Mapa $publish_path/$folder_2
        Copy-Item Mapa/*.yaml $publish_path/$folder_2/Mapa
        Copy-Item Metadados $publish_path/$folder_2
        Copy-Item Metadados/*.yaml $publish_path/$folder_2/Metadados
        Copy-Item Dockerfile $publish_path/$folder_2
        Copy-Item plataforma.json $publish_path/$folder_2
        Set-Location ..
    
        Write-Host "=========================================="
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
        Write-Host "Build: "$folder_1
        Write-Host "=========================================="

        Set-Location ./$folder_1

        dotnet restore
        dotnet publish -c Release --output $publish_path/$folder_1
        Copy-Item Mapa $publish_path/$folder_1
        Copy-Item Mapa/*.yaml $publish_path/$folder_1/Mapa
        Copy-Item Metadados $publish_path/$folder_1
        Copy-Item Metadados/*.yaml $publish_path/$folder_1/Metadados
        Copy-Item Dockerfile $publish_path/$folder_1
        Copy-Item plataforma.json $publish_path/$folder_1
        Set-Location ..
    
        Write-Host "=========================================="
    }

    $folder_2 = $repo + "_2.0.0"
    $path_2 = Join-Path -Path $parametros_path -ChildPath $folder_2
        
    if (Test-Path -Path $path_2) {

        Write-Host "=========================================="
        Write-Host "Build: "$folder_2
        Write-Host "=========================================="

        Set-Location ./$folder_2

        dotnet restore
        dotnet publish -c Release --output $publish_path/$folder_2
        Copy-Item Mapa $publish_path/$folder_2
        Copy-Item Mapa/*.yaml $publish_path/$folder_2/Mapa
        Copy-Item Metadados $publish_path/$folder_2
        Copy-Item Metadados/*.yaml $publish_path/$folder_2/Metadados
        Copy-Item Dockerfile $publish_path/$folder_2
        Copy-Item plataforma.json $publish_path/$folder_2
        Set-Location ..
    
        Write-Host "=========================================="
    }

    $folder_3 = $repo + "_3.0.0"
    $path_3 = Join-Path -Path $parametros_path -ChildPath $folder_3
        
    if (Test-Path -Path $path_3) {

        Write-Host "=========================================="
        Write-Host "Build: "$folder_3
        Write-Host "=========================================="

        Set-Location ./$folder_3

        dotnet restore
        dotnet publish -c Release --output $publish_path/$folder_3
        Copy-Item Mapa $publish_path/$folder_3
        Copy-Item Mapa/*.yaml $publish_path/$folder_3/Mapa
        Copy-Item Metadados $publish_path/$folder_3
        Copy-Item Metadados/*.yaml $publish_path/$folder_3/Metadados
        Copy-Item Dockerfile $publish_path/$folder_3
        Copy-Item plataforma.json $publish_path/$folder_3
        Set-Location ..
    
        Write-Host "=========================================="
    }
}

Set-Location ..
Set-Location ..

