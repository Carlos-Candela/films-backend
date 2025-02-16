FROM debian:latest

LABEL org.opencontainers.image.authors="carloscandela.alu@iespacomolla.es"

# Actualización de repositorios e instalación
RUN apt-get update && apt-get upgrade -y

# Instalación de Apache2 y PHP
RUN apt-get install -y apache2 \
    php  \
    php-mysql \
    php-yaml \
    curl \
    nano 
RUN apt-get install -y libapache2-mod-php php-mysqli

# Habilitar módulos de Apache
RUN a2enmod rewrite 
RUN a2enmod headers
##

# Exposición del puerto 80
EXPOSE 80

# Comando para iniciar Apache
CMD ["apache2ctl", "-D", "FOREGROUND"]
