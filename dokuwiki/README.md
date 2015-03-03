
# Docker Container f�r den Betrieb des Dokuwiki auf der Webseite

Das Script docker-setup.sh erstellt einen Container mit einem entsprechend konfigurierten Webserver und startet diesen. 
Die Webseite wird lokal auf Port 8081 bereitgestellt. 

## Datenverzeichnis 

Das eigentliche Datenverzeichnis liegt auf dem Server in /var/data/dokuwiki und enth�lt die PHP-Dateien von Dokuwiki sowie die Anwendugsdaten.

## Umzug von dem 'alten' Server

Die daten von dem alten Server kopieren:
scp -r root@freifunk-muenster.de:/var/www/dokuwiki /var/data

Den Besitzer auf www-data �ndern:
chown -R www-data /var/data/dokuwiki 

In der conf/local.php folgende Zeilen erg�nzen:
$conf['basedir'] = '/wiki/';
$conf['baseurl'] = 'http://89.163.231.227';
