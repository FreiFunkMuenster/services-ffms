
# Docker Container für den Betrieb von Graphite auf der Webseite

Das Script docker-setup.sh erstellt einen Container mit einem entsprechend konfigurierten Webserver und startet diesen. 
Die Webseite wird lokal auf Port 8083 bereitgestellt. 

Für den Zugriff auf das Graphite Webinterface ist der Port 8443 auch extern (https) erreichbar.
Die Funktion zum erzeugen von Graphen (/render) ist auch in die "normale" Webseite integriert.

Die Ports 2003 und 2004 zum anliefern von Daten sind an die Freifunk-IP des Servers (10.43.0.12 gebunden)


## Datenverzeichnis 

Das eigentliche Datenverzeichnis liegt auf dem Server in /var/data/graphite Benutzerdatenbank sowie die Anwendungsdaten.

