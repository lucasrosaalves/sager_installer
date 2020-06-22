# sager_installer
 
# Requisitos para instalação

* Instalar git 

* Instalar python na versão 3.7 + 

* Instalar docker

* Habilitar execução de scripts: Acessar como administrador o powershell e executar Set-ExecutionPolicy Unrestricted

* Acessar o diretório database e descompactar o arquivo sagerdumpv8_2.7z


# Instalação completa (plataforma + sager)
* Acessar o diretório scripts e executar o script full_installation.ps1 ou full_installation_nocache

```
O processo realizará a importação de todos os serviços da plataforma e do sager, assim como a instalação de todos os serviços
```

# Instalação manual
* Consultar o arquivo manual_plataforma.md no diretório manual

# Atualização de todos os repositorios
* Acessar o diretório scripts e executar o script git_pull.ps1

# Instalação somente dos serviços da plataforma
* Acessar o diretório scripts e executar o script plataforma_installer.ps1 ou plataforma_installer_nocache.ps1


# Instalação somente dos serviços do sager
* Acessar o diretório scripts e executar o script sager_build_deploy_services.ps1



