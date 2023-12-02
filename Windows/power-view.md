###################################
# Domain Enumeration
###################################
# Get SID for the current domain.
Get-DomainSID

# Get object of another domain.
Get-Domain -Domain domain.local

# Get domain controllers for the current/specified domain.
Get-DomainController
Get-DomainController -Domain domain.local

# Get the default domain policy.
Get-DomainPolicy

# Search for OUs with the specific names.
"*admin*","*server*" | Get-DomainOU

# List computer objects in machines OU.
Get-DomainComputer -SearchBase "LDAP://OU=tMachines,DC=domain,DC=local"

# List computer objects with a specific operating system.
Get-DomainComputer -OperatingSystem '*2016*' -Properties name,operatingsystem

# List computer objects with a specific service principal name.
Get-DomainComputer -SPN '*mssql*' -Properties name

# List computer objects that are trusted to authenticate for other principals.
Get-DomainComputer -TrustedToAuth

# List computer objects that have unconstrained delegation.
Get-DomainComputer -Unconstrained

# List all group objects containing the word admin in group name.
Get-DomainGroup -Identity '*admin*'

###################################
# Local Administrator Enumeration
###################################
# Get the local groups on the local (or remote) machine. Needs administrator privs.
# By default, the Win32 API call NetLocalGroupEnum will be used (for speed). Specifying "-Method WinNT" causes the WinNT service provider to be used instead.
Get-NetLocalGroup -ComputerName SQL1
Get-NetLocalGroup -ComputerName SQL1 -Method WinNT

# Get members of a specific local group on the local (or remote) machine.By default administrator group.
# By default, the Win32 API call NetLocalGroupEnum will be used (for speed). Specifying "-Method WinNT" causes the WinNT service provider to be used instead.
Get-NetLocalGroupMember -ComputerName DC
Get-NetLocalGroupMember -ComputerName DC -Method WinNT

###################################
# GPO Enumeration and Abuse
###################################
# Return GPO applied on OU.
Get-DomainOU -Identity "*student*" -Properties name,gplink | Format-List
Get-DomainGPO -SearchBase "LDAP://cn={3E04167E-C2B6-4A9A-8FB7-C811158DC97C},cn=policies,cn=system,DC=domain,DC=local"

# Returns all GPOs applied on a computer object.
Get-DomainGPO -ComputerName windows1.local

# Returns all GPOs applied on an user object.
Get-DomainGPO -UserIdentity "user"

# Returns all GPOs in a domain that modify local group memberships through 'Restricted Groups' or Group Policy preferences.
Get-DomainGPOLocalGroup -ResolveMembersToSIDs

# Enumerates the machines where a specific domain user/group is a member of a specific local group, all through GPO correlation. 
Get-DomainGPOUserLocalGroupMapping -Identity "user" -LocalGroup "Administrators"

# Finds users who have RDP rights through domain computer-GPO correlation.
Get-DomainGPOComputerLocalGroupMapping -ComputerName PC.domain.local -LocalGroup RDP

# Finds users who have admin rights through OU-GPO correlation.
 Get-DomainGPOComputerLocalGroupMapping -OUIdentity "servers" -LocalGroup Administrators

# Return the GPOs with the name of admin,server.
"*admin*","*server*" | Get-DomainGPO

# Returns all OUs with linked to the specified group policy object.
Get-DomainOU -GPLink "3E04167E-C2B6-4A9A-8FB7-C811158DC97C"

###################################
# Active Directory ACLs
###################################
# Enumerate ACLs for all the GPOs.
Get-DomainGPO | %{Get-DomainObjectAcl -Identity $_.displayname -ResolveGUIDs}

# Enumerates the ACLs for every object in the domain with Get-DomainObjectAcl, and for each returned ACE entry it checks if principal security identifier is -1000 (meaning the account is not built in), and also checks if the rights for the ACE mean the object can be modified by the principal.
Find-InterestingDomainAcl -ResolveGUIDs | Select-Object ObjectDN,ActiveDirectoryRights,securityidentifier | Format-List

###################################
# Domain Trusts
###################################
# Returns the forest object for the current (or specified) forest.
 Get-Forest

# Return all domains for the current (or specified) forest.
 Get-ForestDomain
 
 # Get a list of all domain trusts for the current domain.
 Get-DomainTrust -Domain domain.local
 
 # Return all global catalogs for the current (or specified) forest.
Get-ForestGlobalCatalog

# Return all forest trusts for the current forest or a specified forest.
Get-ForestTrust

###################################
# Hunting for Users
###################################
# get users logged on the local (or a remote) machine. Note: administrative rights needed for newer Windows OSes.
Get-NetLoggedon -ComputerName adminsrv -Verbose

# get session information for the local (or a remote) machine.This function will execute the NetSessionEnum Win32API call to query a given host for active sessions.
Get-NetSession -ComputerName APPSRV -Verbose

# get who is logged onto the local (or a remote) machine through enumeration of remote registry keys.
# Note: This function requires only domain user rights on the machine you're enumerating, but remote registry must be enabled.
Get-RegLoggedOn -ComputerName DC -Verbose

# get remote desktop/session information for the local (or a remote) machine.
# Note: only members of the Administrators or Account Operators local group can successfully execute this functionality on a remote target.
# This function will execute the WTSEnumerateSessionsEx and WTSQuerySessionInformation Win32API calls to query a given RDP remote service for active sessions and originating IPs. 
Get-NetRDPSession -ComputerName STDADMIN -Verbose

# Returns the last user who logged onto the local (or a remote) machine.
# Note: This function requires administrative rights on the machine you're enumerating.
Get-WMIRegLastLoggedOn -ComputerName DC -Verbose

# Tests if the current user has administrative access to the local (or a remote) machine (use the OpenSCManagerW Win32API call).
Test-AdminAccess -Verbose

# Finds machines on the local domain where the current user has local administrator access.
Find-LocalAdminAccess -Verbose

# Enumerates the members of specified local group (default administrators) for all the targeted machines on the current (or specified) domain.
# By default, the API method is used, but this can be modified with '-Method winnt' to use the WinNT service provider.
# Needs admin privs.
 Find-DomainLocalGroupMember -Verbose
 
 # Finds domain machines where specific users are logged into.
 Find-DomainUserLocation -Verbose
 Find-DomainUserLocation -Stealth -Verbose
