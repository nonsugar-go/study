# NTP
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/accurate-time
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/windows-server-2016-improvements
>[!NOTE]
>ドメインに参加している Windows Server 2016 のゲストは、ホストを既定値とするのではなく、最も正確な時刻を利用できます。 この理由により、Windows Server 2012 R2 以前のドメインに参加しているマシンに対して [Hyper-V タイム プロバイダー] 設定を手動で無効にすることが推奨されていました。
# 確認コマンド
```
w32tm /query /peers /verbose
w32tm /query /status /verbose
w32tm /query /configuration /verbose
```
# NTP サーバの設定 (高精度を確保するためのシステム構成方法)
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/configuring-systems-for-high-accuracy
- https://learn.microsoft.com/ja-jp/troubleshoot/windows-server/active-directory/support-boundary-high-accuracy-time
- https://learn.microsoft.com/ja-jp/windows-server/networking/windows-time-service/windows-time-service-tools-and-settings
