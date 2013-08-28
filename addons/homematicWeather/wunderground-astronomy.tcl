#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source config.tcl

# config
set sysvar Wetterprognose-Mond

# verwendete Systemvariablen:
#   Wetterprognose-Mond    Zeichenkette

# Aufruf und Erstellung der xml

set url http://api.wunderground.com/api/$key/astronomy/lang:DL/q/Germany/$ort.xml
exec /usr/bin/wget -q -O /usr/local/addons/homematicWeather/wunderground-astronomy.xml $url

set f [open "/usr/local/addons/homematicWeather/wunderground-astronomy.xml"]
set input [read $f]
close $f

#
# goto section with current observation
#
regexp "<moon_phase>(.*?)</moon_phase>" $input dummy current  ; #get current moon_phase
regexp "<percentIlluminated>(.*?)</percentIlluminated>" $current dummy percentIlluminated  ;
regexp "<ageOfMoon>(.*?)</ageOfMoon>" $current dummy ageOfMoon  ;
regexp "<sunset>(.*?)</sunset>" $input dummy current  ; #get current sunset
regexp "<hour>(.*?)</hour>" $current dummy sunseth  ;
regexp "<minute>(.*?)</minute>\n" $current dummy sunsetm  ;
regexp "<sunrise>(.*?)</sunrise>" $input dummy current  ; #get current sunrise
regexp "<hour>(.*?)</hour>" $current dummy sunriseh  ;
regexp "<minute>(.*?)</minute>" $current dummy sunrisem  ;

#
# set ReGaHss variables
#

set rega_cmd ""
append rega_cmd "var w0 = dom.GetObject('$sysvar');"

append rega_cmd "w0.State('Mondaufgang: $sunseth:$sunsetm\nMonduntergang: $sunriseh:$sunrisem\nSichtbarkeit: $percentIlluminated %\nMondalter: $ageOfMoon Tage');"

rega_script $rega_cmd