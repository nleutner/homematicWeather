#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source conf/config.tcl

# config
set sysvar Wetterprognose-Aktuell

set url http://api.wunderground.com/api/$key/conditions/lang:DL/q/Germany/$ort.xml
if { [catch {exec /usr/bin/wget -q -O /usr/local/addons/homematicWeather/wunderground-conditions.xml $url} error] } {
    puts stderr "Could not reach $url \n$error"
    exit 1
}

set f [open "/usr/local/addons/homematicWeather/wunderground-conditions.xml"]
set input [read $f]
close $f

regexp "<current_observation>(.*?)</current_observation>" $input dummy current  ;
regexp "<observation_time>Last Updated on (.*?)</observation_time>" $current dummy observation_time  ;
regexp "<weather>(.*?)</weather>" $current dummy weather  ;
regexp "<temp_c>(.*?)</temp_c>" $current dummy temp_c  ;
regexp "<relative_humidity>(.*?)</relative_humidity>" $current dummy relative_humidity  ;
regexp "<wind_dir>(.*?)</wind_dir>" $current dummy wind_dir  ;
regexp "<wind_kph>(.*?)</wind_kph>" $current dummy wind_kph  ;
regexp "<pressure_mb>(.*?)</pressure_mb>" $current dummy pressure_mb  ;
regexp "<feelslike_c>(.*?)</feelslike_c>" $current dummy feelslike_c  ;

set rega_cmd ""
append rega_cmd "dom.GetObject('$sysvar').State('Aktualisierung: $observation_time\nBedingungen: $weather\nTemperatur: $temp_c °C\nGefühlt wie: $feelslike_c °C\nLuftdruck: $pressure_mb mb\nLuftfeuchte: $relative_humidity\nWindgeschwindigkeit: $wind_kph km/h\nWindrichtung: $wind_dir');"
append rega_cmd "dom.GetObject('Wetter-Temp-Aktuell').State('$temp_c');"
rega_script $rega_cmd

exit 0;