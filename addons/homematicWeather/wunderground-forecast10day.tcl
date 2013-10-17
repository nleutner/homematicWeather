#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source conf/config.tcl

# config
set sysvar Wetterprognose

set url http://api.wunderground.com/api/$key/forecast10day/lang:DL/q/Germany/$ort.xml
if { [catch {exec /usr/bin/wget -q -O /usr/local/addons/homematicWeather/wunderground-forecast10day.xml $url} error] } {
    puts stderr "Could not reach $url \n$error"
    exit 1
}

set f [open "/usr/local/addons/homematicWeather/wunderground-forecast10day.xml"]
set input [read $f]
close $f

regexp "<period>0</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day0title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day0 ;

regexp "<period>1</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day1title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day1 ;

regexp "<period>2</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day2title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day2 ;

regexp "<period>3</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day3title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day3 ;

regexp "<period>4</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day4title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day4 ;

regexp "<period>5</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day5title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day5 ;

regexp "<period>6</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day6title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day6 ;

regexp "<period>7</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day7title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day7 ;

regexp "<period>8</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day8title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day8 ;

regexp "<period>9</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day9title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day9 ;

regexp "<period>10</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day10title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day10 ;

regexp "<period>11</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day11title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day11 ;

regexp "<period>12</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day12title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day12 ;

regexp "<period>13</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day13title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day13 ;

regexp "<period>14</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day14title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day14 ;

regexp "<period>15</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day15title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day15 ;

regexp "<period>16</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day16title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day16 ;

regexp "<period>17</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day17title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day17 ;

regexp "<period>18</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day18title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day18 ;

regexp "<period>19</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy day19title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy day19 ;

# Simpleforecast

# period 1
regexp "</date>\n\t\t\t\t\t<period>1(.*?)</forecastday>" $input dummy period1 ;
#max temp
regexp "<high>(.*?)</high>" $period1 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp1 ;
#low temp
regexp "<low>(.*?)</low>" $period1 dummy low ;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp1 ;
#rain %
regexp "<pop>(.*?)</pop>" $period1 dummy pop1 ;

# period 2
regexp "</date>\n\t\t\t\t\t<period>2(.*?)</forecastday>" $input dummy period2 ;
#max temp
regexp "<high>(.*?)</high>" $period2 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp2 ;
#low temp
regexp "<low>(.*?)</low>" $period2 dummy low ;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp2 ;
#rain %
regexp "<pop>(.*?)</pop>" $period2 dummy pop2 ;

# period 3
regexp "</date>\n\t\t\t\t\t<period>3(.*?)</forecastday>" $input dummy period3 ;
#max temp
regexp "<high>(.*?)</high>" $period3 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp3 ;
#low temp
regexp "<low>(.*?)</low>" $period3 dummy low;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp3 ;
#rain %
regexp "<pop>(.*?)</pop>" $period3 dummy pop3;

set rega_cmd ""
append rega_cmd "dom.GetObject('$sysvar').State('$day0title\n$day0\n\n$day1title\n$day1\n\n$day2title\n$day2\n\n$day3title\n$day3\n\n$day4title\n$day4\n\n$day5title\n$day5\n\n$day6title\n$day6\n\n$day7title\n$day7\n\n$day8title\n$day8\n\n$day9title\n$day9\n\n$day10title\n$day10\n\n$day11title\n$day11\n\n$day12title\n$day12\n\n$day13title\n$day13\n\n$day14title\n$day14\n\n$day15title\n$day15\n\n$day16title\n$day16\n\n$day17title\n$day17\n\n$day18title\n$day18\n\n$day19title\n$day19');"
append rega_cmd "dom.GetObject('Wetter-MaxTemp-Heute').State('$maxtemp1');"
append rega_cmd "dom.GetObject('Wetter-MinTemp-Heute').State('$lowtemp1');"
append rega_cmd "dom.GetObject('Wetter-Regen-Heute').State('$pop1');"
append rega_cmd "dom.GetObject('Wetter-MaxTemp-Morgen').State('$maxtemp2');"
append rega_cmd "dom.GetObject('Wetter-MinTemp-Morgen').State('$lowtemp2');"
append rega_cmd "dom.GetObject('Wetter-Regen-Morgen').State('$pop2');"
append rega_cmd "dom.GetObject('Wetter-MaxTemp-Uebermorgen').State('$maxtemp3');"
append rega_cmd "dom.GetObject('Wetter-MinTemp-Uebermorgen').State('$lowtemp3');"
append rega_cmd "dom.GetObject('Wetter-Regen-Uebermorgen').State('$pop3');"
rega_script $rega_cmd

exit 0;
