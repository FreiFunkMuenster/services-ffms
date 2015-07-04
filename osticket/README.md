
# Docker Container für den Betrieb des Dokuwiki auf der Webseite

Das Script docker-setup.sh erstellt einen Container mit einem entsprechend konfigurierten Webserver und startet diesen. 
Die Webseite wird lokal auf Port 8081 bereitgestellt. 

## Datenverzeichnis 

Das eigentlichen Datenverzeichnise liegten auf dem Server in 
/var/data/wordpress-db für die Datenbank und 
/ver/data/wordpress-web für die PHP-Dateien von Wordpress sowie den Plugins und Themes.


## Umzug von dem 'alten' Server

Die daten von dem alten Server kopieren:
scp -r root@freifunk-muenster.de:/var/lib/mysql/* /var/data/wordpress-db 

Die daten von dem alten Server kopieren:
scp -r root@freifunk-muenster.de:/var/www/wordpress/* /var/data/wordpress-web 

Den Besitzer auf www-data ändern:
chown -R www-data /var/data/wordpress-web 

Mysql Container manuell starten 
- mysqld --skip-grant-tables 
- update mysql.user set password=null where user = 'root'
- update mysql.user set host=#%' where user = 'wordpress  
- update mysql.db set host='%' where user ='wordpress';
- drop database kanboard;
- drop user kanboard@localhost;
- update wordpress.wp_options set option_value='https://freifunk-muensterland.de' where option_name = 'siteurl';
- update wordpress.wp_options set option_value='https://freifunk-muensterland.de' where option_name = 'home';


Anpassungen in der wp-config.php

/*
Die Anwendung läuft hinter einem Proxy-Server der die SSL Verbindung terminiert,
dadurch kommen bei dem Server nur HTTP anfragen an.
Ob eigentlich eine HTTPS Verbindung verwendet wurde wird von dem ProxyServer
in der Variable HTTP_X_FORWARDED_PROTO mitgeteilt.
*/
if ($_SERVER['HTTP_X_FORWARDED_PROTO'] == 'https')
        $_SERVER['HTTPS']='on';

		
/** MySQL hostname */
define('DB_HOST', getenv('DB_PORT_3306_TCP_ADDR').":".getenv('DB_PORT_3306_TCP_PORT'));


