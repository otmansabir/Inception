include srcs/.env

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
	docker rmi -f mariadb:incption                || true
	docker rmi -f wordpress:incption              || true
	docker rmi -f nginx:incption                  || true
	docker volume rm srcs_incption_mariadb_data   || true
	docker volume rm srcs_incption_wordpress_data || true

ls:
	@echo "- - - - - - - - - - - - - - - - - containers - - - - - - - - - - - - - - - - - "
	@docker container ls | grep 'incption' || true

	@echo "- - - - - - - - - - - - - - - - - images - - - - - - - - - - - - - - - - - "
	@docker image ls | grep 'incption' || true

	@echo "- - - - - - - - - - - - - - - - - volumes - - - - - - - - - - - - - - - - - "
	@docker volume ls | grep 'incption' || true

	@echo "- - - - - - - - - - - - - - - - - networks - - - - - - - - - - - - - - - - - "
	@docker network ls | grep 'incption' || true


fclean: clean
	rm -rf ${WP_DATA}
	rm -rf ${DB_DATA}

re: fclean up
