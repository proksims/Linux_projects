# Simple Docker

Introduction to docker. Developing a simple docker image for your own server.

### **nginx**

**nginx** (pronounced "engine-x") is an open-source reverse proxy server for HTTP, HTTPS, etc. **nginx** is also used as a load balancer, web server and for HTTP caching. The **nginx** project focuses on high parallelism, high performance and low memory usage.

**nginx** has one main process and several worker processes.
The primary task of the main process is to read and check the configuration and manage the worker processes.
The worker processes perform the actual processing of the requests.

How **nginx** and its modules work is defined in the configuration file. By default, the configuration file is called _nginx.conf_

### **Docker**

A container is a new "executable file" that includes all the dependencies the product needs.

The main advantage of containerisation is the isolation of dependencies and a single, simple software start-up point.

Basic terms:

- Docker image - the "package" for the application and dependencies (including system ones).
- Container - an instance of an image, i.e. a 'alive' image.

**Docker** is a platform that is designed to develop, deploy and run applications in containers.
**Docker** is the 'de-facto' standard containerisation tool in the industry, but it is not the first or last among containerisation technologies.

The forerunners of **Docker** containers were virtual machines.
A virtual machine, like a container, isolates the application and its dependencies from the outside environment.
However, **Docker** containers have advantages over virtual machines.
For example, they are very easy to port, consume fewer resources, start and run faster.

A docker image consists of layers. Each layer describes some change to be performed to the data on the running container.
The structure of links between layers is hierarchical. There is a base layer on which the other layers are "overlaid".
The _Dockerfile_ is used to create an image. Each instruction in it creates a new layer.

### **Dockle**

**Dockle** is a container image security checking tool that can be used to find vulnerabilities.

Key features and benefits of **Dockle**:

- searches for vulnerabilities in images
- helps in creating a proper Dockerfile
- easy to use, you only need to specify the image name
- support for _CIS Benchmarks_.

### **Docker Compose**

Docker Compose is a tool for handling tasks related to projects deployment.
Docker Compose can be helpful if several services are used to keep the project running.

Docker Compose is used to simultaneously manage multiple containers that are part of an application.
This tool offers the same features as Docker, but allows to work with more complex distributed applications, e.g. microservices.

## Part 1. Ready-made docker

As the final goal of your little practice you have immediately chosen to write a docker image for your own web server, so first you need to deal with a ready-made docker image for the server.
You chose a pretty simple **nginx**.

**== Task ==**

##### Take the official docker image from **nginx** and download it using `docker pull`.

##### Check for the docker image with `docker images`

##### Run docker image with `docker run -d [image_id|repository]`

##### Check that the image is running with `docker ps`

##### View container information with `docker inspect [container_id|container_name]`

##### From the command output define and write in the report the container size, list of mapped ports and container ip

##### Stop docker image with `docker stop [container_id|container_name]`

##### Check that the image has stopped with `docker ps`

##### Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine, with _run_ command

##### Check that the **nginx** start page is available in the browser at _localhost:80_

##### Restart docker container with `docker restart [container_id|container_name]`

##### Check in any way that the container is running

- Add the following screenshots to the report:
  - the call and output of all commands used in this part of the task;
  - **nginx** start page at _localhost:80_ (address must be shown).

_Note:_ **Don't upload heavy files (>10 mb) to git.**

## Part 2. Operations with container

Docker image and container are ready. Now we can look into **nginx** configuration and display page status.

**== Task ==**

##### Read the _nginx.conf_ configuration file inside the docker container with the _exec_ command

##### Create a _nginx.conf_ file on a local machine

##### Configure it on the _/status_ path to return the **nginx** server status page

##### Copy the created _nginx.conf_ file inside the docker image using the `docker cp` command

##### Restart **nginx** inside the docker image with _exec_

##### Check that _localhost:80/status_ returns the **nginx** server status page

##### Export the container to a _container.tar_ file with the _export_ command

##### Stop the container

##### Delete the image with `docker rmi [image_id|repository]`without removing the container first

##### Delete stopped container

##### Import the container back using the *import*command

##### Run the imported container

##### Check that _localhost:80/status_ returns the **nginx** server status page

- Add the following screenshots to the report:
  - the call and output of all commands used in this part of the task;
  - the contents of the created _nginx.conf_ file;
  - the **nginx** server status page at _localhost:80/status_.

## Part 3. Mini web server

It's time to take a little break from the docker to prepare for the last stage. It's time to write your own server.

**== Task ==**

##### Write a mini server in **C** and **FastCgi** that will return a simple page saying `Hello World!`

##### Run the written mini server via _spawn-fcgi_ on port 8080

##### Write your own _nginx.conf_ that will proxy all requests from port 81 to _127.0.0.1:8080_

##### Check that browser on _localhost:81_ returns the page you wrote

##### Put the _nginx.conf_ file under _./nginx/nginx.conf_ (you will need this later)

## Part 4. Your own docker

Now everything is ready. You can start writing the docker image for the created server.

**== Task ==**

_When writing a docker image avoid multiple calls of RUN instructions_

#### Write your own docker image that:

##### 1) builds mini server sources on FastCgi from [Part 3](#part-3-mini- web-server)

##### 2) runs it on port 8080

##### 3) copies inside the image written _./nginx/nginx.conf_

##### 4) runs **nginx**.

_**nginx** can be installed inside the docker itself, or you can use a ready-made image with **nginx** as base._

##### Build the written docker image with `docker build`, specifying the name and tag

##### Check with `docker images` that everything is built correctly

##### Run the built docker image by mapping port 81 to 80 on the local machine and mapping the _./nginx_ folder inside the container to the address where the **nginx** configuration files are located (see [Part 2](#part-2-operations-with-container))

##### Check that the page of the written mini server is available on localhost:80

##### Add proxying of _/status_ page in _./nginx/nginx.conf_ to return the **nginx** server status

##### Restart docker image

\*If everything is done correctly, after saving the file and restarting the container, the configuration file inside the docker image should update itself without any extra steps

##### Check that _localhost:80/status_ now returns a page with **nginx** status

## Part 5. **Dockle**

Once you've written the image, it's never a bad idea to check it for security.

**== Task ==**

##### Check the image from the previous task with `dockle [image_id|repository]`

##### Fix the image so that there are no errors or warnings when checking with **dockle**

## Part 6. Basic **Docker Compose**

There, you've finished your warm-up. Wait a minute though...
Why not try experimenting with deploying a project consisting of several docker images at once?

**== Task ==**

##### Write a _docker-compose.yml_ file, using which:

##### 1) Start the docker container from [Part 5](#part-5-dockle) _(it must work on local network, i.e., you don't need to use **EXPOSE** instruction and map ports to local machine)_

##### 2) Start the docker container with **nginx** which will proxy all requests from port 8080 to port 81 of the first container

##### Map port 8080 of the second container to port 80 of the local machine

##### Stop all running containers

##### Build and run the project with the `docker-compose build` and `docker-compose up` commands

##### Check that the browser returns the page you wrote on _localhost:80_ as before
