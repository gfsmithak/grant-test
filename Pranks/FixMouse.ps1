powershell.exe -noexit -windowstyle hidden {
$CSharpSig = @'
[DllImport("user32.dll", EntryPoint = "SystemParametersInfo")]
public static extern bool SystemParametersInfo(
                 uint uiAction,
                 uint uiParam,
                 uint pvParam,
                 uint fWinIni);
'@

$mousespeed= Add-Type -MemberDefinition $CSharpSig -Name WinAPICall -Namespace SystemParamInfo –PassThru

$mousespeed::systemparametersinfo(0x0071,0,10,$null)
}
