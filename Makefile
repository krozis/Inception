all: up

up:
	@mkdir -p /home/${USER}/data/mariadb_data
	@mkdir -p /home/${USER}/data/wordpress_data
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

re: down clean_volume clean_containers all

clean_containers:
					docker rmi mariadb:stelie42
#					docker rmi nginx:stelie42

clean_volume:
	sudo rm -rf /home/${USER}/data/mariadb_data/*
	sudo rm -rf /home/${USER}/data/wordpress_data/*

fclean: clean_volume
	docker system prune -a -f

pull:
	docker pull debian:bullseye
	docker pull alpine:3.17

	