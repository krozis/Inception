
NAME		=	inception

# Commands
D_COMP		=	docker-compose -f srcs/docker-compose.yml
D_RMI		=	docker rmi -f 
MKDIR		=	@mkdir -p

# Volumes and data
WP_DATA		=	wordpress_data
DB_DATA		=	mariadb_data
WP_DATA_DIR	=	"/home/${USER}/data/wp_data"
DB_DATA_DIR	=	"/home/${USER}/data/db_data"


# Start and stop

all: up

up:
	$(MKDIR) $(WP_DATA_DIR) $(DB_DATA_DIR)
	$(D_COMP) build
	$(D_COMP) up -d

stop:
	$(D_COMP) stop

down:
	$(D_COMP) down

re: fclean all


# Cleaning and purging part

clean_volume:
	docker volume rm -f srcs_$(DB_DATA) srcs_$(WP_DATA)

clean_images:
	$(D_RMI) nginx:stelie42 mariadb:stelie42 wordpress:stelie42

clean_networks:
	docker network prune -f

clean_all: clean_volume clean_images clean_networks

fclean: down clean_all
