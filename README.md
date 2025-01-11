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
