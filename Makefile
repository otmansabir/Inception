WP_DATA = $(HOME)/data/wordpress
DB_DATA = $(HOME)/data/mariadb

COMPOSE_FILE = ./srcs/docker-compose.yml

all: up

up: 
	@mkdir -p $(WP_DATA)
	@mkdir -p $(DB_DATA)
	docker compose -f $(COMPOSE_FILE) up 

down:
	docker compose -f $(COMPOSE_FILE) down

stop:
	docker compose -f $(COMPOSE_FILE) stop

start:
	docker compose -f $(COMPOSE_FILE) start

build:
	docker compose -f $(COMPOSE_FILE) build

clean: down
	docker rmi -f mariadb:incption
	docker rmi -f wordpress:incption
	docker rmi -f nginx:incption

	@docker ps -qa | xargs -r docker stop
	@docker ps -qa | xargs -r docker rm
	@docker images -qa | xargs -r docker rmi -f
	@docker volume ls -q | xargs -r docker volume rm
	@docker network ls -q | grep -v "bridge\|host\|none" | xargs -r docker network rm
	@rm -rf $(WP_DATA) $(DB_DATA)

re: clean up

prune: clean
	@docker system prune -a --volumes -f
