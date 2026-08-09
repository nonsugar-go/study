# Zabbix

## Install

- https://www.zabbix.com/documentation/current/jp/manual/installation

### 環境

- https://www.zabbix.com/download?zabbix=7.4&os_distribution=ubuntu&os_version=24.04&components=server_frontend_agent_2&db=mysql&ws=apache
- Zabbix: 7.4
- OS: Ubuntu 24.04 Noble (amd64)
- Zabbix component: Server, Frontend, Agent 2
- Database: MySQL
- Web server: Nginx

### Ubuntu 24.04 LTS

# Install

## Install Ubuntu 24.04 LTS

- GNU GRUB: Try or Install Ubuntu Server
- Select your language: English
- Keyboard configuration: **Japanse** / **Japanese - Japanese (OADG 109A)**
- Choose the type of installation:
  - (X) Ubuntu Server
  - ( ) Ubuntu Server (minimized)
  - [ ] Search for third-party drivers
- Network configuraiton
  - ens160:
    - IPv4 Configuration:
      - IPv4 Method: **Manual**
      - Subnet: **192.168.1.0/24**
      - Address: **192.168.1.35**
      - Gateway: **192.168.1.1**
      - Name servers: **1.1.1.1, 8.8.8.8**
      - Search domains: **example.test**
- Proxy configuration: (blank)
- Ubuntu archive mirror configuration: [Done]
- Installer update available: Continue without updating
- Guided storage configuration:
  - (X) Use an entire disk
    - [X] Set up the disk as an LVM group
      [ ] Encrypt the LVM group with LUKS
  - ( ) Custom storage layout
- Storage configuration: [Done]
  - Confirm destructive action: [Continue]
- Prifile configuraiton:
  - Your name: user1
  - Your servers name: zb1
  - Pick a username: (Any)
  - Choose a password: (Any)
- Upgrade to Ubuntu Pro:
  - ( ) Enable Ubuntu Pro
  - (X) Skip for now
- SSH configuration:
  - [X] **Install OpenSSH server**
  - [X] Allow password authentication over SSH
- Featured server snaps: (None)
- Installation complete!: **[reboot now]**

```
$ tmux
$ sudo apt update && sudo apt upgrade -y
```

