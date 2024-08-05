# Origin image
FROM ubuntu:16.04

# Meta Information
MAINTAINER moxiaoxi "momomoxiaoxi@gmail.com"

# update
RUN apt update

# Setup Server Environment
RUN apt install -y \
    apache2 \
    php \
    libapache2-mod-php

# add new user if it is needed
# RUN useradd -d /home/ctf/ -m -p ctf -s /bin/bash ctf
# RUN echo "ctf:ctf" | chpasswd


COPY admin /var/www/html/admin
COPY otp /var/www/html/otp
COPY numeric /var/www/html/numeric
COPY crack /var/www/html/crack
COPY magic /var/www/html/magic
COPY bypass /var/www/html/bypass
COPY index.php /var/www/html/index.php

RUN chown root:root -R /var/www/html && \
    rm /var/www/html/index.html && \
    rm /var/www/html/index.php


EXPOSE 80

COPY main.sh /
ENTRYPOINT ["/main.sh"]
