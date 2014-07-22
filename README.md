docker-apache2-php-mariadb
==========================

Docker image to PHP and PostgreSQL standard projects.

How to get?
-----------

You have two options to build this image, the first one is pull from Docker Hub:

	docker pull brunoric/docker-apache2-php-postgresql

You can also clone `brunoric/docker-apache2-php-postgresql` from GitHub and build it yourself from the Dockerfile with the
following command executed on the docker-apache2-php-postgresql folder:

	docker build -t brunoric/docker-apache2-php-postgresql .


How to use?
-----------

Start the container with the below command:

	docker run -d -p 80:80 -p 5432:5432 -v /path/of/your/app:/app brunoric/docker-apache2-php-postgresql

Some options that can be changed at the container's startup:

- Enable Apache AllowOverride (to use .htaccess files) with `-e OVERRIDE=true`.
- Enable PHP short_open_tags with `-e SHORT_TAG=true`.
- Enable PHP display_errors with `-e ERRORS=true`.

Example of usage with these options:

	docker run -d -p 80:80 -p 5432:5432 -v /path/of/your/app:/app -e OVERRIDE=true -e SHORT_TAG=true -e ERRORS=true brunoric/docker-apache2-php-postgresql

To check what is the IP of your container just run the command below:

    docker inspect --format '{{ .NetworkSettings.IPAddress }}' <CONTAINER_ID>

What does this command?
-----------------------

- The `-p` parameters bind ports to the container, thereby `-p 80:80` and `-p 3306:3306` bind port 80 and 3306 of your
system to the exposed ports of Apache2 and MariaDB 10 respectively.

- The `-v` parameter mount volumes of your system into the container. Change `/path/of/your/app` to the real path of the
application that you will run. The `/app` is the Apache2 root of this image, so when you mount your folder application
that will be accessible via `http://<CONTAINER_IP>`.

- The `-e` parameters sets values to the given enviroment variable.

Important notes
---------------

- Your application is accessible via `http://<CONTAINER_IP>` and your database `psql -h <CONTAINER_IP> -U postgres change@this*passw0rd`.
- Don't forget to change your `postgres` password with the query `ALTER USER postgres WITH PASSWORD '<NEW_PASSWORD>';` after connected to the database server.
- Docker documentation: [https://docs.docker.com][1]

[1]: https://docs.docker.com