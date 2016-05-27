Powershell.exe -windowstyle hidden {
notepad.exe
[void] [system.reflection.assembly]::loadwithpartialname("'microsoft.visualbasic")
[microsoft.visualbasic.interaction]::appactivate("notepad")
[void] [system.reflection.assembly]::loadwithpartialname("'system.windows.forms")
[system.windows.forms.sendkeys]::sendwait("IGotHacked")
}
