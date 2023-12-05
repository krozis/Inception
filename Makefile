
# CMD
D_COMP		=	docker-compose -f srcs/docker-compose.yml
D_RMI		=	docker rmi -f 
MKDIR		=	@mkdir -p
RM			=	rm -rf

# Volumes and data
DATA_PREFIX	=	inception
WP_DATA		=	wordpress_data
DB_DATA		=	mariadb_data
WP_DATA_DIR	=	"/home/${USER}/data/$(WP_DATA)"
DB_DATA_DIR	=	"/home/${USER}/data/$(DB_DATA)"


# Start and stop

all: up

up:
	$(MKDIR) $(WP_DATA_DIR) $(DB_DATA_DIR)
	$(D_COMP) up -d

down:
	$(D_COMP) down

re: fclean all


# Cleaning and purging part

clean_volume:
	docker volume rm -f $(DATA_PREFIX)_$(DB_DATA) $(DATA_PREFIX)_$(WP_DATA)
	$(RM) $(WP_DATA_DIR) $(DB_DATA_DIR)

clean_images:	clean_ng clean_db clean_wp

clean_ng:
			$(D_RMI) nginx:stelie42

clean_db:
			$(D_RMI) mariadb:stelie42

clean_wp:
			$(D_RMI) wordpress:stelie42

clean_all: clean_volume clean_images

fclean: down clean_all

purge: fclean
		docker system prune -a -f

