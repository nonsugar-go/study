# Hyper-v
# Hyper-V Requirements
- Win 10 Pro or Enterprise 64 bit Ed.
- Win 2016 Std. or DataCenter Ed.
- 64 bit Processor
- Virtualization enbled in the BIOS
- Data Execution Protection (DEP)
- Second Levvel Address Tranlation) (SLAT)

- msinfo32 でチェック
  - システムの要約で、以下が「はい」であること
    - Hpyer-V - VM モニター モード拡張機能
    - Hyper-V - 第 2 レベル アドレス変換拡張機能
    - Hyper-V - ファームウェアで仮想化が有効
    - Hyper-V - データ実行防止
## Hyper-V on ESXi の場合
vi で VMNAME.vmx を編集する。
```
vhv.enable = "TRUE"
hypervisor.cpuid.v0="FALSE"
```
# Hyper-V のインストール
- サーバー マネージャー > 管理 > 役割と機能の追加 (役割で **Hyper-V** を選択)
# Hyper-V の設定
- サーバー/拡張セッション モード ポリシー/拡張セッション モードを許可する: ☑
(仮想マシン接続で、クリップボードのコピぺとファイルのコピペが使えるようになる)
- ユーザー/キーボード/仮想マシン接続の実行中に Windows キーをどのように組み合わせて使用しますか？: 全画面で実行中にのみ仮想マシンで使用する
# Windows 11 に Hyper-V マネージャーをインストールして、Hyper-V マネージャーで接続
- https://www.vwnet.jp/windows/WS16TP2/HVMan/Credential.htm
- https://www.support.nec.co.jp/DownLoad.aspx?file=WS2022_Hyper-V_install.pdf&id=3140108387
- https://jpn.nec.com/nx7700x/support/ws2019/WS2019_Hyper-V_install.pdf
(2.1.2  一部の環境におけるライブマイグレーション操作に必要な設定)
## 手順
1. 管理用ユーザーの作成 (サーバー側の操作): コンピューターの管理 (Win+X, G) > システム ツール > ローカル ユーザーとグループ
   - ユーザー名: vmadmin, 所属グループ: Hyper-V Administrators, Remote Management Users (既定の Users は消してよい)
3. Hyper-V (サーバー側の操作): PowerSehll (管理者として実行)
```powershell
Enable-WSManCredSSP -Role Server -Force
```
3. Windows 11 (クライアント側): 設定 (Win+I), システム > オプション機能 > Windows のその他の機能, Hyper-V/Hyper-V 管理ツール にチェック
4. Windows 11 (クライアント側): PowerShell (管理者として実行)
```powershell
winrm quickconfig -Force
Enable-WSManCredSSP -Role Client -DelegateComputer * -Force
```
5. Windows 11 (クライアント側): ローカル グループ エディタ (gepedit.msc)
  - コンピューターの構成 > 管理用テンプレート > システム > 資格情報の委任 > NTLM のみのサーバー認証で新しい資格情報の委任を許可する: 有効, 表示: WSMAN/*
  - コンピューターの構成 > 管理用テンプレート > システム > 資格情報の委任 > NTLM のみのサーバー認証で保存された資格情報の委任を許可する: 有効, 表示: *
6. Hyper-V マネージャーを起動 > サーバーに接続
  - 別のコンピューター: IP アドレスを指定
  - 別のユーザーとして接続する: ユーザー名: **.\vmadmin** (**このアカウントを記憶する** にチェック)
# 仮想マシンの作成
- https://learn.microsoft.com/ja-jp/windows/whats-new/windows-11-requirements#virtual-machine-support

|OS|仮想マシンの世代|起動メモリ|動的メモリ|最小RAM|最大RAM|仮想HDD|セキュアブート|TPM|プロセッサ数|
|--|--|--|--|--|--|--|--|--|--|
|Windows 11|第2世代|4GB|有効|512MB|4096MB|64GB|有効(テンプレート: Microsoft Windows)|有効|2|
