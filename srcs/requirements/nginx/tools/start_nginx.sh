echo "--------- NGINX START ---------\n"

# Permet d'afficher la version de nginx
nginx -v


# Impose à nginx de tourner en foreground plutôt qu’en background 
# quelque soit ce qui a été paramétré dans le fichier de configuration.
# Il est indispensable de faire tourner nginx en “foreground” sinon le container s’arrêtera à la fin du script.
nginx -g 'daemon off;'