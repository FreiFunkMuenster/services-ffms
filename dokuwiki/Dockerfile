FROM php:5.6-apache
MAINTAINER Christian Elberfeld <elberfeld@web.de>

# Change apache settings
RUN a2enmod rewrite
 
# Enable htaccess
RUN awk '/<Directory \/var\/www\/>/,/AllowOverride None/{sub("None", "All",$0)}{print}' /etc/apache2/apache2.conf >apache2.conf.temp && mv apache2.conf.temp /etc/apache2/apache2.conf

# Expose ports
EXPOSE 80

# startup
CMD ["apache2-foreground"]

