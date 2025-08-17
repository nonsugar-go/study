# SECCON2013 Online CTF

## Find the key!

```py
#!/usr/bin/env python3
from scapy.all import ICMP, IP, Raw, rdpcap
import sys
pkts = rdpcap('seccon_q1_pcap.pcap')
f = open('ans.png', 'wb')
for i, pkt in enumerate(pkts):
    if IP in pkt and pkt[IP].dst == '192.168.88.129':
        if ICMP in pkt and Raw in pkt:
            print(pkt.summary())
            bs = bytes(pkt[Raw])
            print('data:', bs.hex())
            pos = bs.find(b'\x89\x50\x4e\x47')
            if pos >= 0:
                f.write(bs[pos:])
                for j in range(i+1, i+4):
                    f.write(bytes(pkts[j][Raw])[28:])
                f.close()
                sys.exit(0)
f.close()
```
