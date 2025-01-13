# TIPS
# sshd
- https://blog.jbs.co.jp/entry/2023/11/29/085601
```powershell
Add-WindowsCapability -Online -Name OpenSSH.Server
Start-Service sshd
Set-Service -Name sshd -StartupType Automatic
New-NetFirewallRule -Name TCP_22 -DisplayName TCP_22 -Protocol TCP -LocalPort 22 -Action Allow
```
