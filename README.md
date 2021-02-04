# GETSPOTenantConfiguration

# GetSPOFarmConfigurationinText

This Powershell script will allow you to gather SharePoint Online Configuration Information.
Open up SharePoint Online Management Shell as Administrator.
Run with an account that is a member of local administrator.
Point to the GetSPOtenantmconfig.ps1 file.

Script will send output to a text file located in c:\temp\GetSPOTenantconfig.ps1
Check that you have a Temp directory in your C:\ drive or edit the
location of the file in the script

Script will create a c:\temp\spotenantconfig file with the following information

SPO External User
SPOTenant Information
SharePoint Online sites size in MB
All Users (Must enter url of site)
Templates
SPOSiteGroup (Must enter url of site)



Contents of the script contains the following text as follows:

Write-Warning "This is only a test to gather SharePoint Online Tenant information"
Write-Warning "TCheck that you have a C:\temp directory"
Write-Warning "Make sure you downloaded and installed the latest version of SharePoint Management Shell at 
at https://www.microsoft.com/en-us/download/details.aspx?id=35588"

Import-Module Microsoft.Online.SharePoint.PowerShell -DisableNameChecking

# Save the current execution policy so it can be reset
$SaveExecutionPolicy = Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned -Scope Currentuser

#Connect to SPO
Connect-SPOService -Url https://yoururl.sharepoint.com -credential yourglobaladminname@microsoft311.onmicrosoft.com

# View all of the other SPO management shell cmdlets by running the #following 
#get-help *SPO* | where modulename –eq #microsoft.online.sharepoint.powershell


# Gets the External users
Write-Host "Get-SPOExternalUser"
"SPO External User" | Out-File -FilePath c:\temp\spotenantconfig.txt -append

Get-SPOExternalUser >> c:\temp\spotenantconfig.txt


# Gets the tenant information
Write-Host "Get-SPOTenant"
"SPOTenant" | Out-File -FilePath c:\temp\spotenantconfig.txt -append
Get-SPOTenant >> c:\temp\spotenantconfig.txt


# Gets the sites sizes in MB
Write-Host "Sites size in MB" 
"SharePoint sites size in MB" | Out-File -FilePath c:\temp\spotenantconfig.txt -append
Get-SPOSite -Limit All| select url, @{label="Size in MB";Expression={$_.usage.storage/1MB}} | Sort-Object -Descending -Property "Size in MB" | Format-Table –AutoSize >> c:\temp\spotenantconfig.txt 

# Gets SPOUser
Write-Host "Get-SPOUser"
"All Users" | Out-File -FilePath c:\temp\spotenantconfig.txt -append
Get-SPOUser >> c:\temp\spotenantconfig.txt

# Gets the web templates
Write-Host "Get-SPOWebTemplate
"
"Templates" | Out-File -FilePath c:\temp\spotenantconfig.txt -append
Get-SPOWebTemplate >> c:\temp\spotenantconfig.txt


# Gets the Site Groups
Write-Host "Get-SPOSiteGroup"
"SPOSiteGroup" | Out-File -FilePath c:\temp\spotenantconfig.txt -append
Get-SPOSiteGroup >> c:\temp\spotenantconfig.txt

Write-Host "Completed. Thank you!" 
Write-Host "Author: Anthony Teekah" 

# Reset the execution policy to the original state
Set-ExecutionPolicy $SaveExecutionPolicy -Scope Currentuser
