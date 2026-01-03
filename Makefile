NAME = inception

#no cache???
all:
	mkdir -p /home/${USER}/data/data_db
	mkdir -p /home/${USER}/data/data_wp
	docker compose up -d --build

down:
	docker compose down

up:
	docker compose up -d

fclean: down
	docker system prune --all --force --volumes
	docker volume rm inception_www-pages inception_db
	rm -rf /home/${USER}/data

re: down all

.PHONY: all down up fclean