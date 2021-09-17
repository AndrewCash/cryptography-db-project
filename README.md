# CPSC 4376 DB

## start a simple msqyl server
Make sure docker is installed and running.
```
$ docker ps

CONTAINER ID   IMAGE     ...
```
Launch docker container
```
$ docker-compose -f mysql.yml up
```

### defaults
```
account: root
password: example
```

## connect to db

### web client 
open browser and go to
```
https://localhost:8080
```

### CLI

#### Docker Desktop

Find the container currently running
![find container running](https://imgur.com/xXewlc3.png)

Press the connect with cli button
![connect with cli](https://imgur.com/tv6B8zD.png)

```
root@runningID$ mssql --password
```

#### bash
```
$ docker ps

CONTAINER ID   IMAGE     ...
runningID      mysql     ...
...
```
```
$ docker exec -it runningID /bin/bash
```
(only need the first few characters of $containerID)

```
root@runningID$ mssql --password
```


