# Gaia

**評価ライセンスを使用するために時刻が合っている必要があります。
ssh でログインして、`show clock`, `show ntp current` で確認します。
## CPSMS

### First Time Configuration Wizard (FTW)

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.41
   - Subnet mask: 255.255.255.0
   - Default Gateway: 192.168.1.1
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth1
   - Configure IPv4: Off
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPSMS
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Use Network Time Protocol (NTP): (X)
     - Preferred NTP server: ntp.nict.jp, Type: Server, Version: 4
     - Secondary NTP server: time.google.com, Type: Server, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [_]
   - Security Management: [X]
     - Define Security Management as: Primary
8. Security Management Administrator
   - Define a new administrator
     - Administrator Name: secadmin
     - New Password: Lab@12345
9. Security Management GUI Clients
   - GUI clients can log into the Security Management from: Network
     - IP Address: 192.168.1.0
     - Subnet: 255.255.255.0
10. First Time Configuration Wizard Summary
    - Update and Data Sharing settings
      - Allow automatic download and installation of security and software updates.: [X]
        - Allow automatic download and installation of new software features: [X]
      - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
        - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW1A

### First Time Configuration Wizard (FTW)

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.42
   - Subnet mask: 255.255.255.0
   - Default Gateway: 192.0.2.62
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth4
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.2
   - Subnet mask: 255.255.255.192
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW1A
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Use Network Time Protocol (NTP): (X)
     - Preferred NTP server: ntp.nict.jp, Type: Server, Version: 4
     - Secondary NTP server: time.google.com, Type: Server, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [X]
     - type: ClusterXL
8. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
9. First Time Configuration Wizard Summary
   - Update and Data Sharing settings
     - Allow automatic download and installation of security and software updates.: [X]
       - Allow automatic download and installation of new software features: [X]
     - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
       - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW1B

### First Time Configuration Wizard (FTW)

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.43
   - Subnet mask: 255.255.255.0
   - Default Gateway: 192.0.2.62
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth4
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.3
   - Subnet mask: 255.255.255.192
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW1B
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Use Network Time Protocol (NTP): (X)
     - Preferred NTP server: ntp.nict.jp, Type: Server, Version: 4
     - Secondary NTP server: time.google.com, Type: Server, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [X]
     - type: ClusterXL
8. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
9. First Time Configuration Wizard Summary
   - Update and Data Sharing settings
     - Allow automatic download and installation of security and software updates.: [X]
       - Allow automatic download and installation of new software features: [X]
     - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
       - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]

## CPGW2

### First Time Configuration Wizard (FTW)

1. Deployment Options
   - Setup: Continue with R82.10 configuration
2. Management Connection
   - Interface: eth0
   - Configure IPv4: Manually
   - IPv4 address: 192.168.1.44
   - Subnet mask: 255.255.255.0
   - Default Gateway: 192.0.2.126
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth2
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.65
   - Subnet mask: 255.255.255.192
   - Configure IPv6: Off
4. Device Information
   - Host Name: CPGW2
   - Domain Name: cplab.test
   - Primary DNS Server: 8.8.8.8
   - Secondary DNS Server: 1.1.1.1
   - Tertiary DNS Server: (None)
   - Use a Proxy server: [_]
5. Date and Time Settings
   - Use Network Time Protocol (NTP): (X)
     - Preferred NTP server: ntp.nict.jp, Type: Server, Version: 4
     - Secondary NTP server: time.google.com, Type: Server, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster: [_]
8. Dynamically Assigned IP
   - Does this gateway have a dynamically assigned IP address (DAIP gateway)?: No
9. Secure Communication to Management Server
   - Activation Key: SIC@12345
   - Connect to your Management as a Service: [_]
10. First Time Configuration Wizard Summary
    - Update and Data Sharing settings
      - Allow automatic download and installation of security and software updates.: [X]
        - Allow automatic download and installation of new software features: [X]
      - Allow sending non-personal telemetry data to enable remote monitoring of critical alerts and improve the product and its security: [X]
        - I approve sharing core dumps files and other relevant crash data whitch might contain personal information. All shared data will be processed in accordance with Check Point's Privacy Policy: [_]
