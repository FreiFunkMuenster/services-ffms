FROM php:5.6-apache
MAINTAINER Christian Elberfeld <elberfeld@web.de>

# Change apache settings
RUN a2enmod rewrite
 
# Expose ports
EXPOSE 80

# startup
CMD ["apache2-foreground"]

