# dockerApp
Sample php app in docker

### You will need the following
- [dockerWebServer](https://github.com/lukasztecza/dockerWebServerAndVisualizer)
- [dockerMysqlServer](https://github.com/lukasztecza/dockerMysqlServer)
- build both apps above
- init swarm following readme in dockerWebServer
- deploy dockerWebServer
- build app
```
bash manifest/dev/1_build.sh
```
- create `srv/Config/parameters.json`
```
{
    "environment": "dev",
    "databaseEngine": "mysql",
    "databaseHost": "app-mysql-server",
    "databasePort": "3306",
    "databaseName": "app_database",
    "databaseUser": "user",
    "databasePassword": "pass"
}
```
- deploy app

```
bash manifest/dev/2_deploy.sh
```
