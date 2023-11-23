all:
		docker-compose down --volumes
		docker image rm db:stelie42
		docker-compose up

re:
		sudo rm -rf ~/data/mysql/*
		all

bug:
		docker-compose down --volumes
		docker-compose up