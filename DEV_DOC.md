# Inception - Developer Documentation

This document provides instructions for developers to set up, build, and manage the Inception project.

## 1. Environment Setup

### Prerequisites
Before starting make sure the following are installed on your system:
- Docker
- Docker Compose
- Make
- Git
- Any text editor (to change variables in `.env` and credentials in the `secrets` folder)

### Configuration Files and Secrets

##### 1. .env file
Contains all environment variables needed by Docker Compose:
```
DOMAIN_NAME = [your_domain_here]
WORDPRESS_CONTAINER_NAME = [wordpress_container_name]

MYSQL_NAME = [your_database_name_here]
MYSQL_USER = [your_mysql_user_here]
DB_NAME = [your_db_name_here]

WORDPRESS_TITLE = [your_wordpress_title_here]
WORDPRESS_ADMIN = [your_wordpress_admin_here]
WORDPRESS_EMAIL = [your_wordpress_email_here]

WP_USER = [your_wp_user_here]
WP_EMAIL = [your_wp_email_here]
```
##### 2. Place the .env file in the root directory of the project.
##### 3. Ensure that the `.env` file is **not tracked in Git (add to `.gitignore`)**

##### 4. Passwords in the secrets folder
Each file contains the password

```
.
├── database_root.txt
├── database_user.txt
├── wordpress_admin.txt
└── wordpress_user.txt
```

## 2. Building and Launching the Project

### Using Makefile

The Makefile provides shortcuts for common tasks:

- **Build images and start containers**

`make`

- **Start containers (after stopping them)**

`make up`

- **Stop and remove containers**

`make down`

- **Rebuild everything**

`make re`

- **Stop and remove everything**
**!** Carefull: this command **cleans** out **all** the **saved
data**  (**DELETES volumes and saved files**)

`make fclean`

### Using Docker Compose Directly

- **Build and start**

`docker compose up -d --build`

- **Stop and remove**

`docker compose down`

- **Rebuild a single service**
`docker compose build <service_name>`

## 3. Managing Containers and Volumes
### Containers
List all running containers:
`docker ps`
Stop a specific container:

`docker stop <container_name>`

Remove a container:

`docker rm <container_name>`
### Volumes

List all volumes:

`docker volume ls`

Remove unused volumes:

`docker volume prune`

Volumes are used to persist data between container restarts, particularly for:

- MariaDB database

- WordPress

## 4. Project Data Storage and Persistence

All persistent data is stored in Docker volumes to ensure that data is not lost when containers are removed.
These are also mounted on the host machine under `/home/$USER/data`

Typical Volume Structure

**inception_db** – stores MariaDB database files

**inception_www-pages** – stores WordPress content

These are only get cleaned with the `make fclean` command.
