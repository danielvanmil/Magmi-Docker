FROM fastwhitecat/php-56-apache

RUN apt-get install -y unzip

ADD https://github.com/macopedia/magmi-m2/archive/200.7.23.zip /tmp/magmi.zip /tmp/magmi.zip

RUN unzip /tmp/magmi.zip -d /var/www/html/

COPY php.ini /usr/local/etc/php/
COPY 000-default.conf /etc/apache2/sites-available/
COPY /magmi-m2-200.7.23/magmi/web/magmi_config_setup.php /var/www/html/magmi/web/
COPY /magmi-m2-200.7.23/magmi/web/magmi_upload.php /var/www/html/magmi/web/
COPY /magmi-m2-200.7.23/magmi/web/plugin_upload.php /var/www/html/magmi/web/

RUN cd /etc/apache2/sites-enabled/ && ln -s ../sites-available/000-default.conf

RUN chown -R www-data: /var/www/html/magmi/

VOLUME /var/www/html/magmi/
