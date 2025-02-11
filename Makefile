COMPOSE = srcs/docker-compose.yml

all: up

up:
	@mkdir -p /home/tgriblin/data
	@mkdir -p /home/tgriblin/data/mariadb
	@mkdir -p /home/tgriblin/data/wordpress
	@docker-compose -f $(COMPOSE) up -d

down:
	@docker-compose -f $(COMPOSE) down

re:
	@mkdir -p /home/tgriblin/data
	@mkdir -p /home/tgriblin/data/mariadb
	@mkdir -p /home/tgriblin/data/wordpress
	@docker-compose -f $(COMPOSE) up -d --build

start:
	@docker-compose -f $(COMPOSE) start

stop:
	@docker-compose -f $(COMPOSE) stop

restart:
	@docker-compose -f $(COMPOSE) restart
