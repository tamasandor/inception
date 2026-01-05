# Inception
*This project has been created as part of the 42 curriculum by atamas*

### Description
This project is about system administration by using Docker.
I had to create from scratch 3 dockerfiles and had to connect them under one wordpress website.

### Instructions
To run this project you will need to have the following applications installed:
```
Git (to clone the project)
Docker
Docker Compose
Make
Text editor of your choice
```
The Makefile creates 2 folders under `/home/$USER/data` for the volumes. This gets cleaned by the `make fclean` command.
**How to run the project**
- In the root directory place a `.env` file. You can use the example env file to create this.
- In the secrets folder put passwords in the files. Again, you can use the example files, make sure to remove the `example_` in front of it or you can use this command to create the files <br>`cd ./secrets/ && ls -l | grep example | awk '{print $9}' | cut -f2- -d_| xargs touch`<br>
(**Creates the empty files, you will need to put passwords in manually**)
- In the root directory run the `make` command.
- You can access the wordpress site on `htpps://localhost`.
- If you wan't to log in to the wordpress administration site go to `https://localhost/wp-admin`

### Project description

#### Virtual machines

As the name suggests, virtual machines (VMs) provide virtualization of an entire machine (server). A virtual machine emulates the hardware components of a physical machine, such as the CPU, memory, network interface card, USB controllers, and sound cards. You can run a guest operating system and multiple applications in the virtual environment.

#### Docker

A VM lets you run a virtual machine on any hardware. Docker lets you run an application on any operating system. It uses isolated user-space instances known as containers.

Docker containers have their own file system, dependency structure, processes, and network capabilities. The application has everything it requires inside the container and can run anywhere. Docker container technology uses the underlying host operating system kernel resources directly.

#### Secrets vs Environment Variables

A secret is any piece of data, such as a password, certificate, or API key, that shouldn’t be transmitted over a network or stored unencrypted in a Dockerfile or in your application’s source code.

Docker Compose provides a way for you to use secrets without having to use environment variables to store information. If you’re injecting passwords and API keys as environment variables, you risk unintentional information exposure. Services can only access secrets when explicitly granted by a secrets attribute within the services top-level element.

Environment variables are often available to all processes, and it can be difficult to track access. They can also be printed in logs when debugging errors without your knowledge. Using secrets mitigates these risks.

#### Docker Network vs Host Network


**Docker Network**: Provides isolated networks (e.g., bridge, overlay) for containers to communicate securely and independently. Best for container isolation and flexibility.
**Host Network**: Shares the host's network stack with the container, offering better performance but no isolation. Use when isolation isn’t needed (e.g., high-performance apps).

#### Docker Volumes vs Bind Mounts

**Volumes**: Managed by Docker, stored in `/var/lib/docker/volumes/`, and ideal for persistent, isolated data shared between containers.
**Bind Mounts**: Directly connects a host directory to the container, useful for development and real-time file changes. Less secure and harder to manage in production.

### Resources
Resources that I saved from the beginning of the project and I found usefull:
##### Docker commands:
- https://docs.docker.com/reference/dockerfile/
##### Difference between RUN, CMD, and ENTRYPOINT
- https://www.docker.com/blog/docker-best-practices-choosing-between-run-cmd-and-entrypoint/
##### PID 1
- https://cloud.theodo.com/en/blog/docker-processes-container
##### How to solve access denied for root
- https://stackoverflow.com/questions/17975120/access-denied-for-user-rootlocalhost-using-password-yes-no-privileges
##### How to configure Wordpress
- https://cloud.theodo.com/en/blog/docker-processes-container
