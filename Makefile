LOGIN			= llopes-n
COMPOSE 		= src/Docker-compose.yml
VOLUMES_PATH	= /home/$(LOGIN)/data
DOMAIN			= 127.0.0.1       $(LOGIN).42.fr
LOOKDOMAIN		= $(shell grep "${DOMAIN}" /etc/hosts)


all: hosts build up

up: 
	docker-compose --file=$(COMPOSE) up --build

build:
	sudo mkdir -p $(VOLUMES_PATH)/mysql
	docker volume create --name mariadb_volume --opt type=none --opt device=$(VOLUMES_PATH)/mysql --opt o=bind
	sudo mkdir -p $(VOLUMES_PATH)/wordpress
	docker volume create --name wordpress_volume --opt type=none --opt device=$(VOLUMES_PATH)/wordpress --opt o=bind

list:
	docker ps -all

network:
	docker network ls

hosts:
	@if [ "${DOMAIN}" = "${LOOKDOMAIN}" ]; then \
	echo "host is set"; \
	else cp /etc/hosts ./hosts.bkp; \
		 sudo rm /etc/hosts; \
		 sudo cp ./src/requeriments/nginx/hosts /etc/hosts; \
	fi


down:
	docker-compose --file=$(COMPOSE) down -v --rmi all --remove-orphans

clean: down
	docker system prune --all

fclean: clean
	sudo rm -rf $(VOLUMES_PATH)/wordpress
	docker volume rm wordpress_volume
	docker volume rm mariadb_volume
	@sudo mv ./hosts.bkp /etc/hosts || echo "hosts.bkp does not exist"

re: fclean all