FROM php:5.6-apache
MAINTAINER Christian Elberfeld <elberfeld@web.de>

# Upload-Limits hoch setzen (Edit by Parad0x)
RUN touch /usr/local/etc/php/conf.d/uploads.ini \
    && echo "upload_max_filesize = 10M;" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size = 10M;" >> /usr/local/etc/php/conf.d/uploads.ini

# Change apache settings
RUN a2enmod rewrite
 
# Expose ports
EXPOSE 80

# startup
CMD ["apache2-foreground"]

