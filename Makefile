all: up

up:
	@mkdir -p /home/${USER}/data/mariadb_data
	@mkdir -p /home/${USER}/data/wordpress_data
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

stop: down clean_containers clean_volume

re: stop all

clean_containers:
					docker rmi nginx:stelie42 mariadb:stelie42

clean_volume:
	sudo rm -rf /home/${USER}/data/*

fclean: clean_volume
	docker system prune -a -f

pull:
	docker pull debian:bullseye
	docker pull alpine:3.17

	