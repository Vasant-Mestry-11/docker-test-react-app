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
- `docker run -p 5051:5051 <image_id>` this is will do is port 5051 of container will bind and give access to outside the container
