all: apache2-php-postgresql

apache2-php-postgresql:
	sudo docker build -t brunoric/docker-apache2-php-postgresql .