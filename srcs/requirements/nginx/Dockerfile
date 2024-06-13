FROM debian:buster
RUN apt update && apt upgrade

RUN apt install nginx -y
RUN apt install vim -y && apt install curl -y

RUN mkdir -p /etc/nginx/ssl
RUN apt install openSSL -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Lausanne/O=42/OU=42/CN=itovar-n.42.fr/UID=itovar-n"

RUN mkdir -p /var/run/nginx
RUN mkdir /var/www/wordpress
RUN chmod 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/start_nginx.sh /usr/local/start_nginx.sh

RUN chmod +x /usr/local/start_nginx.sh

EXPOSE 443

ENTRYPOINT [ "sh", "/usr/local/start_nginx.sh"]
