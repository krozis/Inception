all: up

up:
	@mkdir -p /home/${USER}/data/mariadb_data
	@mkdir -p /home/${USER}/data/wordpress_data
	docker-compose -f srcs/docker-compose.yml up -d

down: clean_volume
	docker-compose -f srcs/docker-compose.yml down

re: fclean all

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

fclean: down clean_all

purge: fclean
	docker system prune -a -f

pull:
	docker pull alpine:3.17

	