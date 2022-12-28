FROM ubuntu:20.04

ENV GHOSTUSER ghostuser
ENV WEBSITENAME webexample
ENV DBHOST localhost
ENV DBUSER ghost
ENV DBPASS 123
ENV DBNAME ghost_dev
ENV GHOSTPORT 8000
ENV GHOSTIP 127.0.0.1

RUN useradd -ms /bin/bash "$GHOSTUSER"
RUN usermod -aG sudo "$GHOSTUSER"

RUN apt-get update -y \
 && apt-get upgrade -y \
 && apt install -y \
        apt-utils \
        curl \
        mysql-server \
        nginx \
        software-properties-common \
        sudo \
        systemd \
 && ( curl -sL https://deb.nodesource.com/setup_16.x | -E bash ) \
 && apt install -y nodejs

#RUN add-apt-repository ppa:pitti/systemd
#RUN apt-get install ufw -y
#RUN ufw allow 'Ngnix full'

RUN npm install ghost-cli@latest -g

RUN mkdir -p /var/www/"$WEBSITENAME"
RUN chown "$GHOSTUSER":"$GHOSTUSER" /var/www/"$WEBSITENAME"
RUN chmod 775 /var/www/"$WEBSITENAME"

USER "$GHOSTUSER"
WORKDIR /home/"$GHOSTUSER"

WORKDIR /var/www/"$WEBSITENAME"

CMD ghost config --db mysql --dbhost "$DBHOST" --dbuser "DBUSER" --dbpass "DBPASS" --dbname "DBNAME" &&  \
    ghost config --port "$GHOSTPORT" --ip "$GHOSTIP" && \
    ghost install
