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

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt install software-properties-common -y

#RUN add-apt-repository ppa:pitti/systemd

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install systemd  -y
RUN apt-get install apt-utils -y
RUN apt-get install sudo -y
RUN apt-get install curl -y
RUN apt-get install mysql-server -y
RUN apt-get install nginx -y

#RUN apt-get install ufw -y
#RUN ufw allow 'Ngnix full'

RUN curl -sL https://deb.nodesource.com/setup_16.x | sudo -E bash
RUN apt-get install -y nodejs

RUN apt-get update -y
RUN apt-get upgrade -y

RUN mkdir -p /var/www/"$WEBSITENAME"
RUN chown "$GHOSTUSER":"$GHOSTUSER" /var/www/"$WEBSITENAME"
RUN chmod 775 /var/www/"$WEBSITENAME"

#USER "$GHOSTUSER"
#WORKDIR /home/"$GHOSTUSER"

WORKDIR /var/www/"$WEBSITENAME"

EXPOSE "$GHOSTPORT"

CMD npm install ghost-cli@latest -g && \
    ghost config --db mysql --dbhost "$DBHOST" --dbuser "DBUSER" --dbpass "DBPASS" --dbname "DBNAME" &&  \
    ghost config --port "$GHOSTPORT" --ip "$GHOSTIP" && \
    ghost install 