
# Docker Container für den Betrieb des Dokuwiki auf der Webseite

Das Script docker-setup.sh erstellt einen Container mit einem entsprechend konfigurierten Webserver und startet diesen. 
Die Webseite wird lokal auf Port 8081 bereitgestellt. 

## Datenverzeichnis

Das eigentliche Datenverzeichnis liegt auf dem Server in /var/data/dokuwiki und enthält die PHP-Dateien von Dokuwiki sowie die Anwendugsdaten.

## Umzug von dem 'alten' Server

Die Daten von dem alten Server kopieren:
scp -r root@freifunk-muenster.de:/var/www/dokuwiki /var/data

Den Besitzer auf www-data ändern:
chown -R www-data /var/data/dokuwiki

In der conf/local.php folgende Zeilen ergänzen:
$conf['basedir'] = '/wiki/';
$conf['baseurl'] = 'http://89.163.231.227';
