# Gaia Clish

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Introduction-to-CLI.htm
- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/EN/CP_R82_CLI_ReferenceGuide/Content/Topics-CLIG/Introduction.htm

> [!NOTE]
>
> Gaia Clish で下記のメッセージが表示された場合には、`local database override` を入力する必要があります。
>
> ```
> CLINFR0519  Configuration lock present. Can not execute this command. To acquire the lock use the command 'lock database override'.
> ```
>
> - https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Gaia-Clish-Configuration-Lock.htm

## ライセンスの確認

```sh
CPSMS> cplic print
Host             Expiration  Features



======================================================================
 Check Point product trial period will expire in 15 days.
 Until then, you will be able to use the complete Check Point Product Suite.
 Please obtain a permanent license from Check Point User Center at:
 https://usercenter.checkpoint.com/pub/usercenter/get_started.html
======================================================================
```

## 再起動・停止

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Shut-Down.htm

```sh
reboot
halt
```

## インターフェース

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Physical-Interfaces.htm

```sh
show interfaces
show interface eth0
```

## スタティックルート

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/IPv4-Static-Routes-Gaia-Clish.htm

```sh
show route static
```

## ホスト名

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Hosts-and-DNS-System-Name.htm

```sh
show hostname
show domainname
```

## スタティックホストエントリ

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Hosts-and-DNS-Hosts.htm

```sh
show host names
```

## DNS

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Hosts-and-DNS-DNS.htm

```sh
show dns
```

## 時刻の設定・表示

```sh
set date 2026-03-20
set time 19:15:00
show timezone
show clock
```

## NTP

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/JP/CP_R82_Gaia_AdminGuide/Content/Topics-GAG/Time-Gaia-Clish.htm

```sh
CPSMS> show ntp servers
IP Address               Type              Version  Preferred

ntp.nict.jp              server            4        yes
time.google.com          server            4        no
CPSMS> show ntp current
133.243.238.244
```

# ClusterXL

- https://sc1.checkpoint.com/documents/R82/WebAdminGuides/EN/CP_R82_CLI_ReferenceGuide/Content/Topics-CLIG/CXLG/ClusterXL-Monitoring-Commands.htm

```sh
CPGW1A> show cluster state

Cluster Mode:   High Availability (Active Up) with IGMP Membership

ID         Unique Address  Assigned Load   State          Name

1 (local)  192.168.255.1   100%            ACTIVE         CPGW1A
2          192.168.255.2   0%              STANDBY        CPGW1B


Active PNOTEs: None

Last member state change event:
   Event Code:                 CLUS-114904
   State change:               ACTIVE(!) -> ACTIVE
   Reason for state change:    Reason for ACTIVE! alert has been resolved
   Event time:                 Fri May 15 10:50:59 2026

Cluster failover count:
   Failover counter:           0
   Time of counter reset:      Fri May 15 09:32:29 2026 (reboot)
```

## watch で HA ステータスを監視

```sh
expert
watch cphaprob state
```

```
Every 2.0s: cphaprob state                               CPGW1A: Fri May 15 11:46:39 2026


Cluster Mode:   High Availability (Active Up) with IGMP Membership

ID         Unique Address  Assigned Load   State          Name


1 (local)  192.168.255.1   100%            ACTIVE         CPGW1A
2          192.168.255.2   0%              STANDBY        CPGW1B
```
