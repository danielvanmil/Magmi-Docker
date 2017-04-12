FROM fastwhitecat/php-56-apache

RUN apt-get install -y unzip

ADD https://github.com/dweeves/magmi-git/releases/download/0.7.22/magmi_full_0.7.22.zip /tmp/magmi.zip

RUN unzip /tmp/magmi.zip -d /var/www/html/

COPY php.ini /usr/local/etc/php/
COPY 000-default.conf /etc/apache2/sites-available/
COPY /magmi/web/magmi_config_setup.php /var/www/html/magmi/web/
COPY /magmi/web/magmi_upload.php /var/www/html/magmi/web/
COPY /magmi/web/plugin_upload.php /var/www/html/magmi/web/

RUN cd /etc/apache2/sites-enabled/ && ln -s ../sites-available/000-default.conf

RUN chown -R www-data: /var/www/html/magmi/

VOLUME /var/www/html/magmi/
