$all_services_path = Get-Location

&$all_services_path\git_clone.ps1
&$all_services_path\plataforma_installer_nocache.ps1
&$all_services_path\import_database.ps1
&$all_services_path\sager_build_deploy_services.ps1