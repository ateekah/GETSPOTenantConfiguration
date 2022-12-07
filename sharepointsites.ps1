Import-Module Microsoft.Online.Sharepoint.PowerShell -DisableNameChecking
 
$AdminSiteURL="https://m365x31609423-admin.sharepoint.com"
 
$Credential = Get-credential
Connect-SPOService -url $AdminSiteURL -Credential $Credential
 
#sharepoint online list all site collections powershell
Get-SPOSite -Detailed | Format-Table Url, Template, StorageUsageCurrent, StorageQuota, LastContentModifiedDate -AutoSize 

pause

#sort by size
Get-SPOSite -Detailed | select Url, StorageUsageCurrent, LastContentModifiedDate | Sort-Object StorageUsageCurrent –Descending 

pause
#sort by date
Get-SPOSite -Detailed | select Url, StorageUsageCurrent, LastContentModifiedDate | Sort-Object LastContentModifiedDate –Descending


#Read more: https://www.sharepointdiary.com/2016/02/get-all-site-collections-in-sharepoint-online-using-powershell.html#ixzz7miav0pXI