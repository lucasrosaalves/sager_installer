#	Manual de instalação da plataforma

### 1. Instalação 

* Clonar o repositório Plataforma-Installer no branch reprocess.

Referência:

```
https://github.com/ONSBR/Plataforma-Installer.git
```

* Acessar a pasta raiz do repositório Plataforma-Installer 

* Adicionar as variável de ambiente do postgres  - POSTGRES_HOST_AUTH_METHOD=trust  (temporário)

Exemplo:

```
  postgres:
    image: postgres:11
    container_name: "postgres"
    ports:
      - 5432:5432
    volumes:
      - pgdata:/var/lib/postgresql/data
    environment:
      - POSTGRES_DB=platform_domain_schema
      - POSTGRES_HOST_AUTH_METHOD=trust 
```

* Executar o comando docker-compose build --no-cache 

* Executar o comando docker network create plataforma_network 

* Executar o comando docker-compose up -d 

### 2. Configuração Banco de dados

* Instalar o PGAdmin

Exemplo:

```
"docker run --name pgadmin --network plataforma_network -e "PGADMIN_DEFAULT_EMAIL=postgres" -e "PGADMIN_DEFAULT_PASSWORD=postgres" -d -p 5050:80 dpage/pgadmin4"
```


* Conectar com o servidor de banco de dados http://localhost:5050 (host: postgres password: postgres)

* Conectar com o banco de dados plataforma_domain_schema


### 3. Instalação do pipenv

* Instalar o python na versão 3.7.x

Referência:

```
https://www.python.org/downloads/
```


* Clonar o repositório platform_deploy na branch master.

Referência:

```
https://github.com/onsplatform/platform_deploy
```

* Acessar a raiz do projeto e executar o comando pipenv --three (TODOS OS COMANDOS DEVEM SER RODADOS COM O PERFIL DE ADMINISTRADOR)

* Acessar a raiz do projeto e executar o comando pipenv install

* Acessar a raiz do projeto e executar o comando pipenv shell


### 4. Configurações de ambiente

* Clonar o repositório sager.domain.fabrica no branch develop

Referência:

```
https://onsvsts.visualstudio.com/SAGER/_git/sager.domain.fabrica
```


* Acessar a raiz do projeto platform_deploy e executar o comando pipenv shell (permanecer com o terminal aberto)

* Acessar a raiz do projeto sager.domain.fabrica/sager e alterar o plataforma.json para o seguinte modelo

```
{
    "app": {
        "type": "domain",
        "tecnology": "node",
        "name": "sager",
        "version": "1.0",
        "description": "Serviço de domínio do SAGER",
        "author": "Fernando Andrade",
        "date_begin_validity": "2018-12-20T00:00",
        "date_end_validity": null,
        "id": "1e581e91-5679-4d9e-91df-2cd322c81c12"
    },
    "solution": {
        "name": "sager",
        "description": "Solução do SAGER",
        "id": "a22d9e4d-c352-4ac2-8321-2c496fe3a116"
    },
    "dbconfig":{
        "db_name":"sager"
    }
}
```

* Acessar a raiz do projeto sager.domain.fabrica/sager e executar o comando para importar as entidades

Exemplo:

```
"python C:\Projetos\ONS\platform_deploy\main.py --create_entities --environment tst --platform docker"

```

* Inserir o branch master na tabela core_branch

Exemplo:

```
INSERT INTO core_branch ("id", "name", "solution_id", "created_at", "deleted", "description", "meta_instance_id", "modified", "owner", "started_at", "status") VALUES
		('b73ac08f-418f-4ac7-9f72-03928b4090dd',    'master',    1,    NULL,    '0',    NULL,    NULL,    NULL,    NULL,    NULL,    NULL);
```


### 5. Fazer dump do banco de dados

* Realizar o download do arquivo de carga 

Referência:

```
https://radixengazure-my.sharepoint.com/:u:/g/personal/lucas_alves_radixeng_com_br/EY6R_1MtvXFFgMmk_s-Fel8BLROqIuQXGuy_U0RaTWC6PA?e=yqyCMq
```


* Copiar o arquivo para o container do postgres

Exemplo:

```
docker cp ./sagerdumpv7.tar postgres:/
```


* Executar restore do dump

Exemplo:

```
docker container exec -it postgres pg_restore -h localhost -p 5432 -U postgres --dbname=platform_domain_schema --schema=entities -F tar -v sagerdumpv7.tar
```


### 6. Publicação de um serviço na plataforma(Pós instalação)

* O arquivo plataforma.json deve seguir o modelo parecido com o modelo a seguir

```
{
    "app": {
        "type": "presentation or process",
        "tecnology": "dotnet",
        "name": "ONS.SAGER.Calculo.Api",
        "container": "onssagercalculomensal",
        "version": "1.0",
		    "date_begin_validity": "1900-01-01T00:00",
        "date_end_validity": null,
        "description": "",
        "author": "Lucas Rosa Alves",
        "id": "6209de2a-3de7-4582-8504-140d5128fb9e"
    },
    "solution": {
        "name": "sager",
        "description": "Solução do SAGER",
        "id": "a22d9e4d-c352-4ac2-8321-2c496fe3a116",
	    	"id_domain": 1
    }
}
```

* O arquivo dockerfile deve seguir o modelo parecido com o modelo a seguir

```

FROM microsoft/dotnet:2.2-sdk
COPY . .
ENV PORT 8088
ENV URL_DOMAIN_SERVICE_LOCAL http://reader/reader/api/v1
ENV SOLUTION_ID 1
ENV SCHEMA_URI http://schema/api/v1
ENTRYPOINT [ "dotnet", "ONS.SAGER.Calculo.Api.Web.dll", "8088" ]

```

* Acessar raiz do projeto

* Criar uma pasta chamada publish

* Executar comando dotnet publish -o .\publish\

* Inserir mapa, metadata, dockerfile e plataforma.json na pasta publish

* Acessar a raiz do projeto platform_deploy e executar o comando pipenv shell (permanecer com o terminal aberto)

* Acessar a raiz da pasta publish no projeto a ser publicado e executar

python C:\Projetos\ONS\platform_deploy\main.py --build --environment tst --platform docker
 
python C:\Projetos\ONS\platform_deploy\main.py --register_schema --environment tst --platform docker

python C:\Projetos\ONS\platform_deploy\main.py  --run_presentation --environment tst --platform docker;