Install-Module -Name "PnP.PowerShell"

#If you want to install or update to the latest nightly built prerelease of PnP PowerShell, run:

Install-Module -Name "PnP.PowerShell" -AllowPrerelease

#Parameter
$SiteURL = "https://m365x31609423.sharepoint.com/sites/UsageReportingClass"
$ListName= "TestListA"
  
#Connect to PnP Online
Connect-PnPOnline -Url $SiteURL 
 
#Get all list items from list in batches
$ListItems = Get-PnPListItem -List $ListName -PageSize 500
 
Write-host "Total Number of List Items:" $($ListItems.Count)
 
#Loop through each Item
ForEach($Item in $ListItems)
{  
    Write-Host "Id :" $Item["ID"] 
    Write-Host "Title :" $Item["Title"]
}


#Read more: https://www.sharepointdiary.com/2016/12/sharepoint-online-get-all-items-from-large-lists-powershell-csom.html#ixzz7m3ZJKEYz