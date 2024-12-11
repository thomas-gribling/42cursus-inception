COMPOSE = srcs/docker-compose.yml

all: up

up:
	@docker-compose -f $(COMPOSE) up -d

down:
	@docker-compose -f $(COMPOSE) down

start:
	@docker-compose -f $(COMPOSE) start

stop:
	@docker-compose -f $(COMPOSE) stop

status:
	@docker ps