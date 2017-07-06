<# This is a simple script to run after running all latest windows update on this template
 to do the following#>


#Clear the C:\Users\Administrator\AppData\Local\Temp Folder
Remove-Item -Path C:\Users\Administrator\AppData\Local\Temp\* -Recurse
Get-ChildItem -Path C:\Users\Administrator\AppData\Local\Temp\ -Recurse
#Remove the Windows Update Regeistry key
Remove-Item -Path HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\WindowsUpdate -Recurse

#clear All Windows Event Logs
$logs = Get-EventLog -List | ForEach-Object {$_.log} | ForEach-Object {Clear-EventLog -LogName $_}
Get-EventLog -List