FROM php:5.6-apache
MAINTAINER Christian Elberfeld <elberfeld@web.de>

#install PHP extensions
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev && rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd
RUN docker-php-ext-install mysqli

# Change apache settings
RUN a2enmod rewrite
 
# Enable htaccess
RUN awk '/<Directory \/var\/www\/>/,/AllowOverride None/{sub("None", "All",$0)}{print}' /etc/apache2/apache2.conf >apache2.conf.temp && mv apache2.conf.temp /etc/apache2/apache2.conf

# Expose ports
EXPOSE 80

# startup
CMD ["apache2-foreground"]
