# Gaia Portal (Web UI)

### System Management > Display Format

- Display Format
  - Time: 24-hour
  - Date: yyyy/mm/dd
  - IPv4 netmask: CIDR notation
  - Autonomous System Number: Plain - single number

## Network Management > Network Interfaces > Edit (eth?)

### CPSMS

| eth? | Enable | Comment  | IPv4 address  | Mask Length |
|------|--------|----------|---------------|-------------|
| eth0 | [X]    | Mgmt     | 192.168.1.41  | 24          |

### CPGW1A

| eth? | Enable | Comment  | IPv4 address  | Mask Length |
|------|--------|----------|---------------|-------------|
| eth0 | [X]    | Mgmt     | 192.168.1.42  | 24          |
| eth1 | [X]    | Internal | 192.168.101.2 | 24          |
| eth2 | [X]    | Sync     | 192.168.255.1 | 24          |
| eth3 | [X]    | External | 192.0.2.2     | 26          |
| eth4 | [X]    | DMZ      | 192.168.102.2 | 24          |

### CPGW1B

| eth? | Enable | Comment  | IPv4 address  | Mask Length |
|------|--------|----------|---------------|-------------|
| eth0 | [X]    | Mgmt     | 192.168.1.43  | 24          |
| eth1 | [X]    | Internal | 192.168.101.3 | 24          |
| eth2 | [X]    | Sync     | 192.168.255.2 | 24          |
| eth3 | [X]    | External | 192.0.2.3     | 26          |
| eth4 | [X]    | DMZ      | 192.168.102.3 | 24          |

### CPGW2

| eth? | Enable | Comment  | IPv4 address  | Mask Length |
|------|--------|----------|---------------|-------------|
| eth0 | [X]    | Mgmt     | 192.168.1.44  | 24          |
| eth1 | [X]    | Internal | 192.168.202.1 | 24          |
| eth2 | [X]    | External | 192.0.2.65    | 26          |

## Network Management > Hosts and DNS

- System Name
  - Host Name: CPSMS / CPGW1A / CPGW1B / CPGW2
  - Domain Name: cplab.test
- DNS
  - DNS Suffix: cplab.test
  - Primary DNS Server: 8.8.8.8
  - Secondary DNS Server: 1.1.1.1
  - Tertiary DNS Server: (None)
- Hosts
  | Hostname  | IPv4 Address | IPv6 Address |
  |-----------|--------------|--------------|
  | CPGW1A    | 192.168.1.42 |              |
  | CPGW1B    | 192.168.1.43 |              |
  | CPGW2     | 192.168.1.44 |              |
  | CPSMS     | 192.168.1.41 |              |
  | localhost | 127.0.0.1    | ::1          |

## Network Management > IPv4 Static Routes

| Destination Address | Next Hop Type | Rank | Local Scope | Gateways (Priority)    | Monitored Protocols | Ping | Comment |
|---------------------|---------------|------|-------------|------------------------|---------------------|------|---------|
| Default             | Normal        | 60   | N/A         | aaa.bbb.ccc.ddd (None) | None                | No   |         |

(必要に応じて、スタティックルートを追加する)

