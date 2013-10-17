#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source conf/config.tcl

# config
set sysvar Wetterprognose-Mond

set url http://api.wunderground.com/api/$key/astronomy/lang:DL/q/Germany/$ort.xml
if { [catch {exec /usr/bin/wget -q -O /usr/local/addons/homematicWeather/wunderground-astronomy.xml $url} error] } {
    puts stderr "Could not reach $url \n$error"
    exit 1
}

set f [open "/usr/local/addons/homematicWeather/wunderground-astronomy.xml"]
set input [read $f]
close $f

regexp "<moon_phase>(.*?)</moon_phase>" $input dummy current  ;
regexp "<percentIlluminated>(.*?)</percentIlluminated>" $current dummy percentIlluminated  ;
regexp "<ageOfMoon>(.*?)</ageOfMoon>" $current dummy ageOfMoon  ;
regexp "<sunset>(.*?)</sunset>" $input dummy current  ;
regexp "<hour>(.*?)</hour>" $current dummy sunseth  ;
regexp "<minute>(.*?)</minute>\n" $current dummy sunsetm  ;
regexp "<sunrise>(.*?)</sunrise>" $input dummy current  ;
regexp "<hour>(.*?)</hour>" $current dummy sunriseh  ;
regexp "<minute>(.*?)</minute>" $current dummy sunrisem  ;

set rega_cmd ""
append rega_cmd "dom.GetObject('$sysvar').State('Mondaufgang: $sunseth:$sunsetm\nMonduntergang: $sunriseh:$sunrisem\nSichtbarkeit: $percentIlluminated %\nMondalter: $ageOfMoon Tage');"
rega_script $rega_cmd
exit 0;