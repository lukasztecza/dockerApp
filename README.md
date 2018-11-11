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
- update your `/etc/hosts` file adding
```
127.0.0.1 www.app.com
```
- now you can hit in browser to see the app output
```
www.app.com
```
- or to see visualizer (if you deployed web server with visualizer)
```
www.app.com:8080
```
