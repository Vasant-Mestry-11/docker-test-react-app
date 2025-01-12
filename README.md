# React + Docker

## Crete container from docker image

- to build the image use docker build . command
- need image id to create container, by using docker image ls you can get image id
- to run the image use docker run <image_id> command
- if you're running application on container using localhost
- you'll be getting site cannot be reached error
- this is because site is running on container's localhost, and you trying to access it outside the container
- to access it outside the container hit docker ps command
- after hitting this command you get container id, container name, image id, last time it has been ran, port, status
- to stop the stop the container use docker stop <container_name>
- if you try to access the port outside the containe then use the command
- if you're using vite use below code in vite config

```
  server: {
    watch: {
      usePolling: true,
    },
    host: true, // needed for docker container port mapping to work
    strictPort: true,
    port: 5173, // replace any port
  }
```

- `docker run -p 5051:5051 <image_id>` this is will do is port 5051 of container will bind and give access to outside the container
- use -d in docker run in detached mode

## Running multiple containers from single image

- to use image on multiple containers, just change the port
  `docker run -d -p 5174:5173 <image_id>`
- use --rm flag to delete the container when its been stopped
- use --name flag to give name to your container

## Name Docker image

- to name docker image we use -t flag in docker build command along with its version

```
  docker build -t mywebapp:0.1 .
```

## Nginx image

Ngnix runs on 80 port by default. NGINX is open source software for web serving, reverse proxying, caching, load balancing, media streaming, and more.

- to pull the image user docker pull nginx
- run the docker image docker run -p 8080:80 nginx:latest

## Run docker in Python

- create build using docker build .
- if you're taking input from user then run docker in interactive mannner, for that use below command

```
  docker run -it <image_id>
```

- -it stands for interactive terminal

## Rename older docker tag to new public repository

- docker tag <older_tag_name> <new_tag_public_repository_name>

## Docker Volume => Python

- Persist file which are being used by the container even if the container stopped and get deleted
- to create volume use below command
- it is stored outside the container hence it doesn't get deleted

```
  docker run -it --rm -v <volume_name>:/{path_of_directory} <image_id>
```

- to see the volume use docker volume ls command

## Mount bind

- Mount bind is used when our code is dependent on external file changes, and that changes should automatically populated on codebase
- Bind mounts have write access to files on the host by default.
- One side effect of using bind mounts is that you can change the host filesystem via processes running in a container, including creating, modifying, or deleting important system files or directories.

- syntax

```
  docker run -v {absolute_path_of_the_file_from_local_directory}:{file_path_from_container_working_director} <image_id>

```

## Container to Container communication

- connect mysql db to python app
- download mysql image
- specify MYSQL_ROOT_PASSWORD="root" as env variable

```
  docker run -d --env MYSQL_ROOT_PASSWORD="root" --env MYSQL_DATABASE="userinfo" --name mysqldb mysql
```

- get container IP address to communicate use below command

```
  docker inspect <container_id>
```

- inside network you can find container ip address
- target this ip from host of the pymsql.connect method
- data in the mysqldb will get preserved until you delete the container, if restart it, data will still persists

## Docker network

- problem in previous connection is to give ip address manual and first we have to mysql container then python container
- to avoid this we can use of docker network
- this means we can store multiple container inside same network so that they can communicate directly
- to create a network use below command

```
  docker network create <network_name>
```

```
  docker run -d --env MYSQL_ROOT_PASSWORD="root" --env MYSQL_DATABASE="userinfo" --network my-net --name mysqldb mysql
```

- in db connection code only host name will get change, instead of ip the name of the container will get specified

## Docker Compose

- Docker Compose is a tool that helps you define and share multi-container applications.
- With Compose, you can create a YAML file to define the services and with a single command, you can spin everything up or tear it all down.

- create docker-compose file with extension .yml / .yaml
- create service
- give name to service
- add image (mysql)
- add environment variables
- enter container name
- and the use below command

```
  <docker_compose_filename> up
```

## Docker compose with multiple containers

- use depends on key to wait for one service till another one is up and running along with healthcheck key

- stdin_open and tty => interactive terminal
- to interact with the terminal you can run services separately so that you do interact with the terminal by using docker-compose

## Docker componse network

- all the service which are defined inside docker compose file are part of one single network, it creates network automatically by itself, hence we don't have to create separate network for it
- when you down docker-compose all the volumes, network are still present
- if you want to delete them after down, use -v flag along with the docker-compose down -v
