# TIPS
# sshd
```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
New-NetFirewallRule -Name TCP_22 -DisplayName TCP_22 -Protocol TCP -LocalPort 22 -Action Allow
```
