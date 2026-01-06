NAME = inception

#no cache???
all:
	mkdir -p /home/${USER}/data/data_db
	mkdir -p /home/${USER}/data/data_wp
	docker compose -p ${NAME} up -d --build

down:
	docker compose -p ${NAME} down

up:
	docker compose -p ${NAME} up -d

fclean: down
	docker volume rm -f ${NAME}_www-pages ${NAME}_db
	docker system prune --all --force --volumes
	rm -rf /home/${USER}/data

re: down all

.PHONY: all re down up fclean