#!/bin/tclsh

# load libaries
load tclrega.so

# include config
source config.tcl

# config
set sysvar Wetterprognose

# verwendete Systemvari
#   Wetterprognose   Zeichenkette


# Ab hier nichts mehr verändern
set url http://api.wunderground.com/api/$key/forecast10day/lang:DL/q/Germany/$ort.xml
exec /usr/bin/wget -q -O /usr/local/addons/homematicWeather/wunderground-forecast10d.xml $url

set f [open "/usr/local/addons/homematicWeather/wunderground-forecast10d.xml"]
set input [read $f]
close $f

regexp "<period>0</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag0title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag0 ;

regexp "<period>1</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag1title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag1 ;

regexp "<period>2</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag2title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag2 ;

regexp "<period>3</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag3title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag3 ;

regexp "<period>4</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag4title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag4 ;

regexp "<period>5</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag5title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag5 ;

regexp "<period>6</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag6title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag6 ;

regexp "<period>7</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag7title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag7 ;

regexp "<period>8</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag8title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag8 ;

regexp "<period>9</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag9title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag9 ;

regexp "<period>10</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag10title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag10 ;

regexp "<period>11</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag11title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag11 ;

regexp "<period>12</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag12title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag12 ;

regexp "<period>13</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag13title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag13 ;

regexp "<period>14</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag14title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag14 ;

regexp "<period>15</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag15title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag15 ;

regexp "<period>16</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag16title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag16 ;

regexp "<period>17</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag17title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag17 ;

regexp "<period>18</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag18title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag18 ;

regexp "<period>19</period>(.*?)</forecastday>" $input dummy current  ; #get current forecastday
regexp "<title>(.*?)</title>" $current dummy tag19title ;
regexp "<fcttext_metric><!\\\[CDATA\\\[(.*?)]]></fcttext_metric>" $current dummy tag19 ;

# set ReGaHss variables
set rega_cmd ""
append rega_cmd "dom.GetObject('$sysvar').State('$tag0title\n$tag0\n\n$tag1title\n$tag1\n\n$tag2title\n$tag2\n\n$tag3title\n$tag3\n\n$tag4title\n$tag4\n\n$tag5title\n$tag5\n\n$tag6title\n$tag6\n\n$tag7title\n$tag7\n\n$tag8title\n$tag8\n\n$tag9title\n$tag9\n\n$tag10title\n$tag10\n\n$tag11title\n$tag11\n\n$tag12title\n$tag12\n\n$tag13title\n$tag13\n\n$tag14title\n$tag14\n\n$tag15title\n$tag15\n\n$tag16title\n$tag16\n\n$tag17title\n$tag17\n\n$tag18title\n$tag18\n\n$tag19title\n$tag19');"
rega_script $rega_cmd

# Simpleforecast

regexp "<simpleforecast>(.*?)</simpleforecast>" $input dummy simpleforecast  ; #get simpleforecast

# period 1
regexp "<period>1(.*?)</forecastday>" $simpleforecast dummy period1 ;

#max temp
regexp "<high>(.*?)</high>" $period1 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp1 ;
#low temp
regexp "<low>(.*?)</low>" $period1 dummy low;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp1
#rain %
regexp "<pop>(.*?)</pop>" $period1 dummy pop1;

# period 2
regexp "<period>2(.*?)</forecastday>" $simpleforecast dummy period2 ;

#max temp
regexp "<high>(.*?)</high>" $period2 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp2 ;
#low temp
regexp "<low>(.*?)</low>" $period2 dummy low;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp2 ;
#rain %
regexp "<pop>(.*?)</pop>" $period2 dummy pop2;

# period 3
regexp "<period>3(.*?)</forecastday>" $simpleforecast dummy period3 ;

#max temp
regexp "<high>(.*?)</high>" $period3 dummy high ;
regexp "<celsius>(.*?)</celsius>" $high dummy maxtemp3 ;
#low temp
regexp "<low>(.*?)</low>" $period3 dummy low;
regexp "<celsius>(.*?)</celsius>" $low dummy lowtemp3 ;
#rain %
regexp "<pop>(.*?)</pop>" $period3 dummy pop3;

# set ReGaHss variables
set rega_cmd ""
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