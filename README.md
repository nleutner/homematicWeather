Einrichtung:
In der Config.tcl muss der wunderground API-key und der Ort eingetragen werden

# wunderground-astronomy.tcl:
Aufruf im homematic Programm
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-astronomy.tcl");

# wunderground-conditions.tcl:
Aufruf im homematic Programm
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-conditions.tcl");

# wunderground-forecast.tcl:
Aufruf im homematic Programm
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast.tcl");

# wunderground-forecast10day.tcl:
Aufruf im homematic Programm
dom.GetObject("CUxD.CUX2801001:1.CMD_EXEC").State("cd /usr/local/addons/homematicWeather && tclsh wunderground-forecast10day.tcl");

