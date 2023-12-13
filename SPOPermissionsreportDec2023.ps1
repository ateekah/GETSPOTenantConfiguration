#Finds Group name, permissions, and members of that group
#Import SharePoint Online Management Shell
Import-Module Microsoft.Online.Sharepoint.PowerShell -DisableNameChecking

#Variables for SharePoint Online Admin & Target site collection
$AdminSiteURL="https://Yourtenantname-admin.sharepoint.com/"
$SiteCollURL="https://Yourtenantname.sharepoint.com/"

#Get the Credentials
$Credential = Get-credential
#Connect To SharePoint Online
Connect-SPOService -url $AdminSiteURL -Credential $Credential

#Get the Site collection
$Site = Get-SPOSite $SiteCollURL

#Get all Groups of the site collection    
$GroupColl = Get-SPOSiteGroup -Site $Site | Where { $_.Roles -ne $NULL -and $_.Users -ne $NULL}

Foreach($Group in $GroupColl)
{
    #Get Permissions assigned to the Group
    $GroupPermissions=""
    ForEach($Role in $Group.Roles)
    {
        $GroupPermissions+= $Role+";"
    }
    Write-host -f Yellow "Group Name: $($Group.Title) - Permissions: $($GroupPermissions)"

    #Get each member of the group
    foreach($User in $Group.Users)
    {
         write-host -f Green $user
    }              
}
