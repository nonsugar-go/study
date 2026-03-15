# Gaia

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
     - Preferrd NTP Server: ntp.nict.jp, server, Version: 4
     - Secondary NTP Server: time.google.com, server, Version: 4
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
   - Default Gateway: (None)
   - Configure IPv6: Off
3. Internet Connection
   - Interface: eth3
   - Configure IPv4: Manually
   - IPv4 address: 192.0.2.2
   - Subnet mask: 255.255.255.0
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
     - Preferrd NTP Server: ntp.nict.jp, server, Version: 4
     - Secondary NTP Server: time.google.com, server, Version: 4
     - Time Zone: Tokyo, Asia (GMT +9:00)
6. Installation Type
   - Security Gateway and/or Security Management: (X)
7. Products
   - Security Gateway: [X]
   - Security Management: [_]
   - Unit is a part of a cluster, type: ClusterXL
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
