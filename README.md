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
- In the secrets folder put passwords in the files. Again, you can use the example files, make sure to remove the `example_` in front of it or you can use this command to create the files `cd ./secrets/ && ls -l | grep example | awk '{print $9}' | cut -f2- -d_| xargs touch`. (**Creates the empty files, you will need to put passwords in manually**)
- In the root directory run the `make` command.
- You can access the wordpress site on `htpps://localhost`.
- If you wan't to log in to the wordpress administration site go to `https://localhost/wp-admin`
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

### Project description

- Virtual Machines vs Docker
- Secrets vs Environment Variables
- Docker Network vs Host Network
- Docker Volumes vs Bind Mounts