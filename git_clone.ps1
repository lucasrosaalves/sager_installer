git clone --branch reprocess https://github.com/onsbr/plataforma-installer.git .\plataforma_services\plataforma-installer

git clone --branch master https://github.com/onsplatform/platform_deploy .\plataforma_services\platform_deploy

git clone --branch develop https://onsvsts@dev.azure.com/onsvsts/sager/_git/sager.domain.fabrica .\plataforma_services\sager.domain.fabrica



#SAGER 


git clone --branch develop https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/sager.calculo.util.fabrica ./sager_services/sager.calculo.util.fabrica
git clone --branch release/1.0.0 https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/sager.calculo.uge.fabrica ./sager_services/sager.calculo.uge.fabrica
git clone --branch release/1.0.0 https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/sager.calculo.usina.fabrica ./sager_services/sager.calculo.usina.fabrica

#presentations

$branch = "develop"
$repos = (
"sager.baseconsulta.manter.fabrica.radix",
"sager.calculo.api.fabrica",
"sager.calculo.frontend.fabrica")

foreach($repo in $repos) {
    Write-Host "=========================================="
    Write-Host "Cloning the Repository: "$repo
    Write-Host "=========================================="
    $repo_url = "https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/"+$repo
    git clone --branch $branch $repo_url ./sager_services/presentations/$repo
}


#taxas

$branch = "release"
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
    Write-Host "=========================================="
    Write-Host "Cloning the Repository: "$repo
    Write-Host "=========================================="
    $repo_url = "https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/"+$repo
    git clone --branch $branch/1.0.0 $repo_url ./sager_services/taxas/$repo"_1.0.0"
	git clone --branch $branch/2.0.0 $repo_url ./sager_services/taxas/$repo"_2.0.0"
}


#parametros

$branch = "release"
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
    Write-Host "=========================================="
    Write-Host "Cloning the Repository: "$repo
    Write-Host "=========================================="
    $repo_url = "https://onsvsts@dev.azure.com/onsvsts/SAGER/_git/"+$repo
	
    git clone --branch $branch/1.0.0 $repo_url ./sager_services/parametros/$repo"_1.0.0"
	git clone --branch $branch/2.0.0 $repo_url ./sager_services/parametros/$repo"_2.0.0"
	git clone --branch $branch/3.0.0 $repo_url ./sager_services/parametros/$repo"_3.0.0"
}
