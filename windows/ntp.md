# NTP
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/accurate-time
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/windows-server-2016-improvements
- [https://qiita.com/sugenuma/items/d48a3543e22cf497589e](WindowsサーバNTPクライアント設定/確認コマンドまとめ #ntp - Qiita)
>[!NOTE]
>ドメインに参加している Windows Server 2016 のゲストは、ホストを既定値とするのではなく、最も正確な時刻を利用できます。 この理由により、Windows Server 2012 R2 以前のドメインに参加しているマシンに対して [Hyper-V タイム プロバイダー] 設定を手動で無効にすることが推奨されていました。
# 確認コマンド
```
w32tm /query /peers /verbose
w32tm /query /status /verbose
w32tm /query /configuration /verbose
```
# NTP サーバの設定 (高精度を確保するためのシステム構成方法)
- https://learn.microsoft.com/ja-jp/troubleshoot/windows-server/active-directory/configure-authoritative-time-server
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/configuring-systems-for-high-accuracy
- https://learn.microsoft.com/ja-jp/troubleshoot/windows-server/active-directory/support-boundary-high-accuracy-time
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/windows-time-service-tools-and-settings
- https://atmarkit.itmedia.co.jp/ait/articles/1205/17/news135_4.html
- https://atmarkit.itmedia.co.jp/ait/articles/1205/17/news135_2.html#annflag

## レジストリの設定
キーの場所 | 値の名前 | 値の種類 | 値のデータ
-- | -- | -- | -- 
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters | Type | REG_SZ | NTP
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | AnnounceFlags | REG_DWORD | 10 (0xa) -> **5**
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer | Enabled | REG_DWORD | 1
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Parameters | NtpServer | REG_SZ | time.windows.com,0x8 -> **ntp.nict.jp,0x8 ats1.e-timing.ne.jp,0x8**
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | MaxPosPhaseCorrection | REG_DWORD | 54000 (15時間)
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | MaxNegPhaseCorrection | REG_DWORD | 54000 (15時間)

レジストリ変更後反映
```pwsh
net stop w32time; net start w32time
```

Windows Firewall の受信規則の設定
```pwsh
 New-NetFirewallRule -DisplayName "UDP_123" -Protocol UDP -LocalPort 123 -Action Allow
```

キーの場所 | 値の名前 | 値の種類 | 値のデータ
-- | -- | -- | -- 
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | MinPollInterval | REG_DWORD | 6 (2^6 = 64秒)
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | MaxPollInterval | REG_DWORD | 10 (2^10 = 1024秒 = 17分4秒)
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | UpdateInterval | REG_DWORD | 100
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient | SpecialPollInterval | REG_DWORD | 1024 -> **64**
HKLM\SYSTEM\CurrentControlSet\Services\W32Time\Config | FrequencyCorrectRate | REG_DWORD | 4 -> **2**

レジストリ変更後反映
```pwsh
net stop w32time; net start w32time
```

## サービスの設定
- サービス (services.msc) > [Windows Time]

項目 | 値
-- | --
[全般] タブ > スタートアップの種類 | 手動 -> 自動

