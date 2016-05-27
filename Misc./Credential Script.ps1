$credential=get-credential
$credential.password | convertfrom-securestring | set-content C:\test.txt
