




get-childitem C:\users\*\documents | select fullname | foreach {if (!(test-path ($_.fullname+"\_A.txt"))){new-item -path ($_.fullname) -name _A.txt -value "testing" -force} }
$user="username@email.com"
$password=get-content C:\EncryptedPassword.txt | convertto-securestring
$cred=new-object system.management.automation.pscredential ($user,$password)
$paths=get-childitem C:\users\*\documents\_A.txt
$referencehash=get-filehash -path C:\_A.txt -algorithm md5 | select -expandproperty hash
While ($true) {

foreach ($path in $paths) {if (!(test-path $path.fullname)) {send-mailmessage -from $user -to $user -subject "Suspicious write activity on $env:COMPUTERNAME" -body "Canary at $env:COMPUTERNAME no longer exists" -credential ($cred) -usessl -smtpserver smtp.office365.com -port "587"} 
    
    else {foreach ($path in $paths) {get-filehash -path $path.fullname -algorithm md5 | select -expandproperty hash | foreach {if ($_ -notmatch $referencehash) {send-mailmessage -from "gsmith@lmjconsulting.com" -to "gsmith@lmjconsulting.com" -subject "Suspicious write activity on $env:COMPUTERNAME" -body "Canary at $env:COMPUTERNAME has been written to" -credential ($cred) -usessl -smtpserver smtp.office365.com -port "587"}}}
         
  sleep 60}}}
          

        
