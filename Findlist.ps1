#Config Variables
$SiteURL = "https://m365x31609423.sharepoint.com/sites/UsageReportingClass"
 
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL -Credentials (Get-Credential)
 
#Get all lists
$Lists = Get-PnPList
 
#Get List Title, Description and Number of Items
$Lists | Select Title, Description, ItemCount


#Read more: https://www.sharepointdiary.com/2018/03/sharepoint-online-get-all-lists-using-powershell.html#ixzz7mignsPYp

Uninstall-Module -Name SharePointPnPPowerShellOnline -AllVersions -Force
Install-Module -Name PnP.PowerShell