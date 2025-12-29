NAME = inception

#no cache???
all:
	docker compose up -d --build

down:
	docker compose down

up: all

fclean: down
	docker system prune --all --force --volumes
	docker volume rm inception_www-pages inception_db

re: down all

.PHONY: all down up fclean