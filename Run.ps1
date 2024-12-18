# Check if the script is running as administrator
$runningAsAdmin = [System.Security.Principal.WindowsIdentity]::GetCurrent().Groups -match 'S-1-5-32-544'

if (-not $runningAsAdmin) {
    # Restart the script as Administrator
    $arguments = "& '" + $myinvocation.MyCommand.Path + "'"
    Start-Process powershell -Verb runAs -ArgumentList $arguments
    return
}

# Run the desired command
irm https://get.activated.win | iex
