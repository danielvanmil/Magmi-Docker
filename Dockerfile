FROM fastwhitecat/php-56-apache

RUN apt-get install -y unzip

ADD https://github.com/macopedia/magmi-m2/archive/200.7.23.zip /tmp/magmi.zip

RUN unzip /tmp/magmi.zip -d /var/www/html
RUN mv /var/www/html/magmi-m2-200.7.23/magmi /var/www/html/magmi

COPY php.ini /usr/local/etc/php/
COPY 000-default.conf /etc/apache2/sites-available/
COPY /magmi/web/magmi_config_setup.php /var/www/html/magmi/web/
COPY /magmi/web/magmi_upload.php /var/www/html/magmi/web/
COPY /magmi/web/plugin_upload.php /var/www/html/magmi/web/

RUN ls -al /var/www/html/magmi
RUN cd /etc/apache2/sites-enabled/ && ln -s ../sites-available/000-default.conf

RUN chown -R www-data: /var/www/html/magmi/

VOLUME /var/www/html/magmi/
