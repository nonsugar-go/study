# Hyper-v
# Hyper-V Requirements
- Win 10 Pro or Enterprise 64 bit Ed.
- Win 2016 Std. or DataCenter Ed.
- 64 bit Processor
- Virtualization enbled in the BIOS
- Data Execution Protection (DEP)
- Second Levvel Address Tranlation) (SLAT)

- msinfo32 でチェック
  - システムの要約で、[Hpyer-V - VM Monitor Mode Extensions], [Hyper-V - Second Level Address Translation Extentions], [Hyper-V - Virtualization Enabled in firmware], [Hyper-V - Data Execution Protection]
が yes であること
# Windows 11 に Hyper-V マネージャーをインストールして、Hyper-V マネージャーで接続
- https://www.vwnet.jp/windows/WS16TP2/HVMan/Credential.htm
- https://jpn.nec.com/nx7700x/support/ws2019/WS2019_Hyper-V_install.pdf
(2.1.2  一部の環境におけるライブマイグレーション操作に必要な設定)
## 手順
1. Hyper-V (サーバー側の操作): PowerSehll (管理者として実行)
```powershell
Enable-WSManCredSSP -Role Server -Force
```
2. Windows 11 (クライアント側): 設定 (Win+I), システム > オプション機能 > Windows のその他の機能, Hyper-V/Hyper-V 管理ツール にチェック
3. Windows 11 (クライアント側): PowerShell (管理者として実行)
```powershell
winrm quickconfig -Force
Enable-WSManCredSSP -Role Client -DelegateComputer * -Force
```
4. Windows 11 (クライアント側): ローカル グループ エディタ (epedit.msc)
  - コンピューターの構成 > 管理用テンプレート > システム > 資格情報の委任 の NTLM のみのサーバー認証で新しい資格情報の委任を許可する: 有効, WSMAN/*
  - 「NTLM のみのサーバー認証で保存された資格情報の委任を許可する」
