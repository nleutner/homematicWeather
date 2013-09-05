Implementierung der wunderground.com API

####Benötigte Addons:
#####CCU1:
[Telnet](http://www.homematic-inside.de/software/addons/item/telnet-dienst) -> mit Telnet ein Passwort für den FTP Zugang auf der CCU einrichten

Telnet Session (Windows) öffnen:

*   Start
*   Eingabeaufforderung
*   `telnet`
*   `open 192.168.X.X`
*   `root`
*   `passwd`
*   dein Passwort
*   dein Passwort

[FTP](http://www.homematic-inside.de/software/addons/item/ftp) -> Installieren

[Filezilla](https://filezilla-project.org/) -> Ordner aus dem GIT kopieren und nach */usr/local/addons/* kopieren

*   Server:192.168.X.XXX
*   User:root
*   Passwort:dein Passwort was beim Telnet gesetzt wurde

#####CCU2:
[Filezilla](https://filezilla-project.org/) -> Ordner aus dem GIT kopieren und nach */usr/local/addons/* kopieren

*   Server: sftp://192.168.X.XX
*   User:root
*   Passwort: MuZhlo9n%8!G
*   Port: 22

#####CCU1/CCU2
[Wunderground](http://deutsch.wunderground.com/weather/api/) -> Api Wunderground Developer Key

[CUx-Daemon](http://www.homematic-inside.de/software/cuxdaemon) -> Performance schonender Aufruf

*   homematic->Einstellungen->Systemsteuerung->Zusatzsoftware
*   Cux-Damon->Einstellen
*   Geräte
*   CUxD Gerätetyp -> (28)System) 

![CuxD](https://github.com/nleutner/homematicWeather/blob/develop/addons/homematicWeather/doc/images/Cux%20Exec.jpg?raw=true)

*   homematic->Posteingang  

![homematic](https://raw.github.com/nleutner/homematicWeather/develop/addons/homematicWeather/doc/images/Cux%20CCU.gif)



###addons/homematicWeather





####config.tcl
Hier müssen die Werte angepasst werden

 Variabel                 |Beschreibung                                                                |
:-------------------------|:---------------------------------------------------------------------------|
ort                       |Name des Ortes für den das Wetter abgefragt werden soll                     |
key                       |Ist der API key von [wunderground](http://api.wunderground.com/weather/api/)

####wunderground-conditions.tcl
Dieses Programm ruft die aktuelle Wetterbedingungen auf und schreibt in die Systemvariabel
> Aktualisierung: September 5, 09:59 CEST Bedingungen: Heiter Temperatur: 18.8 °C Gefült wie: 18.8 °C Luftdruck: 1016 mb Luftfeuchte: 79% Windgeschwindigkeit: 4.8 km/h Windrichtung: Südwest


#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetter-Temp-Aktuell       |Zeichenkette |      |

#####Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-conditions.tcl");





####wunderground-astronomy.tcl
Diese Programm holt sich Informationen über den Mond, leider stimmen die Werte Mondaufgang/Untergang von der API wunderground nicht.

#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetterprognose-Mond       |Zeichenkette |      |

#####Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-astronomy.tcl");





####wunderground-forecast.tcl

#####Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast.tcl");





####wunderground-forecast10day.tcl
#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetter-MaxTemp-Heute      |Zahl         |      |°C
Wetter-MaxTemp-Morgen     |Zahl         |      |°C
Wetter-MaxTemp-Uebermorgen|Zahl         |      |°C
Wetter-MinTemp-Heute      |Zahl         |      |°C
Wetter-MinTemp-Morgen     |Zahl         |      |°C
Wetter-MinTemp-Uebermorgen|Zahl         |      |°C
Wetter-Regen-Heute        |Zahl         |      |%
Wetter-Regen-Morgen       |Zahl         |      |%
Wetter-Regen-Uebermorgen  |Zahl         |      |%

#####Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast10day.tcl");