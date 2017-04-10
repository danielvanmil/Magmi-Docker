FROM fastwhitecat/php-56-apache

RUN apt-get install -y unzip

ADD https://github.com/dweeves/magmi-git/releases/download/0.7.22/magmi_full_0.7.22.zip /tmp/magmi.zip

RUN unzip /tmp/magmi.zip -d /var/www/html/

ADD 000-default.conf /etc/apache2/sites-available/

RUN cd /etc/apache2/sites-enabled/ && ln -s ../sites-available/000-default.conf
