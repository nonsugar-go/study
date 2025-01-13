# TIPS
# sshd
- https://blog.jbs.co.jp/entry/2023/11/29/085601
```powershell
Get-WindowsCapability -Online | Where-Object Name -Like "*ssh*"
Add-WindowsCapability -Online -Name OpenSSH.Server
Get-Service -Name sshd | fl *
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
Get-NetFirewallRule | where { (Get-NetFirewallPortFilter -AssociatedNetFirewallRule $_).LocalPort -eq 22 } | fl Name
```
