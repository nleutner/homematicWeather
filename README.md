homematicWeather
Implementierung der wunderground.com API

#Benötigte Addons
http://www.homematic-inside.de/software/item/cuxd Gerät 28

#config.tcl
Ort
key ist der API key von http://api.wunderground.com/weather/api/

#wunderground-conditions.tcl
Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-conditions.tcl");

#wunderground-astronomy.tcl
Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-astronomy.tcl");

#wunderground-forecast.tcl
Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast.tcl");

#wunderground-forecast10day.tcl
Aufruf im homematic Programm:
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast10day.tcl");