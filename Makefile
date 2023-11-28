all: up

up:
	@mkdir -p /home/${USER}/data/mariadb_data
	@mkdir -p /home/${USER}/data/wordpress_data
	docker-compose -f srcs/docker-compose.yml up -d

down:
	docker-compose -f srcs/docker-compose.yml down

cool: down clean_volume clean_wp all

stop: down clean_all

re: stop all

clean_volume:
	docker volume rm -f wordpress mariadb
	sudo rm -rf /home/${USER}/data/*

clean_ng:
			docker rmi nginx:stelie42

clean_db:
			docker rmi mariadb:stelie42

clean_wp:
			docker rmi wordpress:stelie42

clean_all: clean_volume clean_ng clean_db clean_wp

fclean: clean_all
	docker system prune -a -f

pull:
	docker pull alpine:3.17

	