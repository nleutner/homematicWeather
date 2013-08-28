#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source config.tcl

# config
set sysvar Wetterprognose-Aktuell

# verwendete Systemvariablen:
#   Wetterprognose-Aktuell    Zeichenkette

# Ab hier nichts mehr verändern

set url http://api.wunderground.com/api/$key/conditions/lang:DL/q/Germany/$ort.xml
exec /usr/bin/wget -q -O /usr/local/addons/Weather/wunderground-conditions.xml $url

set f [open "/usr/local/addons/Weather/wunderground-conditions.xml"]
set input [read $f]
close $f

regexp "<current_observation>(.*?)</current_observation>" $input dummy current  ; #get current observation
regexp "<observation_time>Last Updated on (.*?)</observation_time>" $current dummy observation_time  ; # letztes update
regexp "<weather>(.*?)</weather>" $current dummy weather  ; # wetterbedingungen
regexp "<temp_c>(.*?)</temp_c>" $current dummy temp_c  ; # temperatur # ZAHL
regexp "<relative_humidity>(.*?)</relative_humidity>" $current dummy relative_humidity  ; # Luftfeuchte # ZAHL
regexp "<wind_dir>(.*?)</wind_dir>" $current dummy wind_dir  ; # windrichtung
regexp "<wind_kph>(.*?)</wind_kph>" $current dummy wind_kph  ; # Windgeschwindigkeit # ZAHL
regexp "<pressure_mb>(.*?)</pressure_mb>" $current dummy pressure_mb  ; # Luftdruck #ZAHL
regexp "<feelslike_c>(.*?)</feelslike_c>" $current dummy feelslike_c  ; # Temp.gefühlt wie

#
# set ReGaHss variables
#
set rega_cmd ""
append rega_cmd "var conditions = dom.GetObject('$sysvar');"
append rega_cmd "conditions.State('Aktualisierung: $observation_time\nBedingungen: $weather\nTemperatur: $temp_c °C\nGefühlt wie: $feelslike_c °C\nLuftdruck: $pressure_mb mb\nLuftfeuchte: $relative_humidity\nWindgeschwindigkeit: $wind_kph km/h\nWindrichtung: $wind_dir');"

rega_script $rega_cmd


