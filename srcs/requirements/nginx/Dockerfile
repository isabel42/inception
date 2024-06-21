FROM debian:buster

# Mise à jour du manager de paquet
RUN apt update && apt upgrade

# Installation de nginx
RUN apt install nginx -y

# Installation de vim et curl (pas strictement nécessaire)
RUN apt install vim -y && apt install curl -y

# Installation de ssl et configuration du certificat
RUN mkdir -p /etc/nginx/ssl
RUN apt install -y openssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Lausanne/O=42/OU=42/CN=itovar-n.42.fr/UID=itovar-n"

# Création des répertoires nécessaires au fonctionnement de nginx
RUN mkdir -p /var/run/nginx
RUN mkdir /var/www/wordpress

# Modification des droits pour que nginx puisse y accéder
RUN chmod 755 /var/www/wordpress

# Modification du propriétaire des fichiers et sous dossier du dossier /var/www/wordpress 
# Le propriétaire de ces fichiers correspond à l'utilisateur choisis dans le fichier de configuration de nginx
RUN chown -R www-data:www-data /var/www/wordpress

# Copie du fichier de configuration et du script de démarrage
COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY tools/start_nginx.sh /usr/local/start_nginx.sh
RUN chmod +x /usr/local/start_nginx.sh

# Exposition du port 443 qui est le port requis pour le protocole SSL (https)
EXPOSE 443

ENTRYPOINT [ "sh", "/usr/local/start_nginx.sh"]
