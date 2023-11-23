all:
		docker-compose down
		docker image rm -f db:MDB
		docker-compose up

re:
		clean_volume
		all

clean_volume:
				sudo rm -rf ~/data/mysql/*

fclean:
		clean_volume
		docker system prune -a -f


pull:
		docker pull debian:bullseye
		docker pull alpine:3.17