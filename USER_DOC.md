# Inception - User Documentation

This document explains how to use and manage the Inception project.

## 1. Project Overview

The Inception project is a Docker-based infrastructure that runs multiple services inside isolated containers.

Services Provided

- **Nginx**
- **Wordpress**
- **Database**

Each service runs in its own container and communicates with the others through a Docker network.

## 2. Start and stop the project

All services are managed by **Docker Compose** which is controllable by the **Makefile** provided.

### Start the Project
From the root directory of the project:
1. Build and start the containers:
`make`
2. Under the hood make is calling
- `docker compose up -d`
- Docker will build the images
- Create the containers
- Start all services in the background

### Stop the project
To stop all running containers:
`make down`
This command:
- Calls `docker compose down`
- Stops the containers
- Removes the containers and the network
- Keeps volumes intact

## 3. Accessing the Website and the administration panel
### Website access
Once the project is running, the website can be accessed via:
- https://atamas.42.fr
(the `/etc/hosts`) file should be properly configured
### WordPress Administration Panel
To access the WordPress admin dashboard:
- Open a browser and go to:
`https://atamas.42.fr`
- Log in using the Wordpress user credentials

## 4. Credentials Managment
Passwords are stored in files for secrets to.
### Password can be found in the secrets folder
- database_root.txt
- database_user.txt
- wordpress_admin.txt
- wordpress_user.txt

### Other variables are stored in the `.env` file

## 5. Checking Service Status
### Check Running Containers

To verify that all services are running:

`docker ps`

You should see containers for:

- Nginx
- WordPress
- MariaDB