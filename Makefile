LOGIN			= llopes-n
COMPOSE 		= src/Docker-compose.yml
VOLUMES_PATH	= /home/$(LOGIN)/data

all: build up

up: 
	docker-compose --file=$(COMPOSE) up --build

build:
	sudo mkdir -p $(VOLUMES_PATH)/wordpress
	docker volume create --name wordpress_volume --opt type=none --opt device=$(VOLUMES_PATH)/wordpress --opt o=bind

list:
	docker ps -all

network:
	docker network ls

down:
	docker-compose --file=$(COMPOSE) down -v --rmi all --remove-orphans

clean: down
	docker system prune --all

fclean: clean
	sudo rm -rf $(VOLUMES_PATH)/wordpress
	docker volume rm wordpress_volume

re: fclean all