Implementierung der wunderground.com API in die homematc

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
Diese Datei ist die einzige die angepasst werden muss.

 Variabel                 |Beschreibung                                                                |
:-------------------------|:---------------------------------------------------------------------------|
ort                       |Name des Ortes für den das Wetter abgefragt werden soll                     |
key                       |Ist dein API key von [wunderground](http://api.wunderground.com/weather/api/)




####wunderground-astronomy.tcl
Diese Programm holt sich Informationen über den Mond, leider stimmen die Werte Mondaufgang/Untergang von der API wunderground nicht.

#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetterprognose-Mond       |Zeichenkette |      |

#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-astronomy.tcl");
```





####wunderground-conditions.tcl
Dieses Programm ruft die aktuelle Wetterbedingungen auf und schreibt in die Systemvariabel Wetter-Temp-Aktuell
> Aktualisierung: September 5, 09:59 CEST Bedingungen: Heiter Temperatur: 18.8 °C Gefült wie: 18.8 °C Luftdruck: 1016 mb Luftfeuchte: 79% Windgeschwindigkeit: 4.8 km/h Windrichtung: Südwest


#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetter-Temp-Aktuell       |Zeichenkette |      |

#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-conditions.tcl");
```





####wunderground-forecast.tcl
Der Unterschied zu forecast10day ist, dass das bereitgestellte xml kleiner ist.
#####Aufruf im homematic Programm:
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast.tcl");
```





####wunderground-forecast10day.tcl
Dieses Programm ruft die Wetterprognose für die nächsten 10 Tage auf und schreibt in die Systemvariabel Wetterprognose
> Donnerstag Heiter. HÃ¶chsttemperatur: 28C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼d-SÃ¼dost.
>
>Donnerstag Nacht Heiter. Tiefsttemperatur: 15C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼d-SÃ¼dost.
>
>Freitag Teils Wolkig. HÃ¶chsttemperatur: 28C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼d-SÃ¼dost.
>
>Freitag Nacht Teils Wolkig. Tiefsttemperatur: 16C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼d-SÃ¼dost.
>
>Samstag Gewitter mÃ¶glich. HÃ¶chsttemperatur: 26C. Light Wind. Regenrisiko 50%.
>
>Samstag Nacht Gewitter mÃ¶glich. Tiefsttemperatur: 12C. Light Wind. Regenrisiko 50%.
>
>Sonntag Gewitter mÃ¶glich. HÃ¶chsttemperatur: 24C. Light Wind. Regenrisiko 40%.
>
>Sonntag Nacht Gewitter mÃ¶glich. Tiefsttemperatur: 10C. Windgeschwindigkeit: 5-15 km/h. Windrichtung: West-SÃ¼dwest. Regenrisiko 40%.
>
>Montag Bedeckt. HÃ¶chsttemperatur: 23C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: West-SÃ¼dwest.
>
>Montag Nacht Bedeckt. Tiefsttemperatur: 9C. Windgeschwindigkeit: 5-10 km/h. Windrichtung: SÃ¼d-SÃ¼dwest.
>
>Dienstag Wolkig. HÃ¶chsttemperatur: 21C. Windgeschwindigkeit: 10-20 km/h. Windrichtung: SÃ¼dwest.
>
>Dienstag Nacht Wolkig. Tiefsttemperatur: 10C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼dwest.
>
>Mittwoch Wolkig. HÃ¶chsttemperatur: 20C. Windgeschwindigkeit: 15-20 km/h. Windrichtung: SÃ¼dwest.
>
>Mittwoch Nacht Wolkig. Tiefsttemperatur: 9C. Windgeschwindigkeit: 10-15 km/h. Windrichtung: SÃ¼dwest.
>
>Donnerstag Regen mÃ¶glich. HÃ¶chsttemperatur: 21C. Windgeschwindigkeit: 10-20 km/h. Windrichtung: West. Regenrisiko 40%.
>
>Donnerstag Nacht Regen mÃ¶glich. Tiefsttemperatur: 7C. Windgeschwindigkeit: 5-15 km/h. Windrichtung: West-SÃ¼dwest-SÃ¼d-SÃ¼dwest.
>
>Freitag Teils Wolkig. HÃ¶chsttemperatur: 20C. Light Wind.
>
>Freitag Nacht Teils Wolkig. Tiefsttemperatur: 12C. Light Wind. Regenrisiko 40%.
>
>Samstag Wolkig. HÃ¶chsttemperatur: 20C. Light Wind.
>
>Samstag Nacht Wolkig. Tiefsttemperatur: 12C. Light Wind.

In die anderen Systemvariabeln werden die jeweiligen Werte direkt geschrieben.

#####Systemvariabeln
 Name                     | Variablentyp| Werte|Maßeinheit
:-------------------------|:------------|:-----|:-------
Wetterprognose            |Zeichenkette |      |
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
```
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast10day.tcl");
```