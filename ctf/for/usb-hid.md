# Human Interface Devices (HID) Specifications

- https://www.usb.org/hid
- https://bsakatu.net/doc/usb-hid-to-scancode/
- https://www2d.biglobe.ne.jp/~msyk/keyboard/layout/usbkeycode.html

## Python code

```python
#!/usr/bin/env python3
# Usage: tshark -r a.pcap -Y "usb.irp_info.direction==1" -T fields -e "usbhid.data"|./solver.py
import sys
hid_map = (
        {0x04 + i: chr(ord("a") + i) for i in range(26)} |
        {0x1e + i: chr(ord("1") + i) for i in range(10)} |
        {0x27: "0", 0x28: "\n", 0x2c: " ", 0x2d: "-", 0x2e: "=", 0x2f: "[",
         0x30: "]", 0x31: "\\", 0x33: ";", 0x34: "'",  0x35: "`", 0x36: ",",
         0x37: ".", 0x38: "/"}
        )
shift_map = (
        {0x04 + i: chr(ord("A") + i) for i in range(26)} |
        {0x1e: "!", 0x1f: "@", 0x20: "#", 0x21: "$", 0x22: "%", 0x23: "^",
         0x24: "&", 0x25: "*", 0x26: "(", 0x27: ")", 0x2d: "_", 0x2e: "+",
         0x2f: "{", 0x30: "}", 0x31: "|", 0x33: ":", 0x34: '"', 0x35: "~",
         0x36: "<", 0x37: ">", 0x38: "?"}
        )
hid_map_jis = (
        {0x04 + i: chr(ord("a") + i) for i in range(26)} |
        {0x1e + i: chr(ord("1") + i) for i in range(10)} |
        {0x27: "0", 0x28: "\n", 0x2c: " ", 0x2d: "-", 0x2e: "^", 0x2f: "@",
         0x30: "[", 0x32: "]", 0x33: ";", 0x34: ":",  0x36: ",", 0x37: ".",
         0x38: "/", 0x87: "\\", 0x89: "\\"}
        )
shift_map_jis = (
        {0x04 + i: chr(ord("A") + i) for i in range(26)} |
        {0x1e: "!", 0x1f: '"', 0x20: "#", 0x21: "$", 0x22: "%", 0x23: "&",
         0x24: "'", 0x25: "(", 0x26: ")", 0x2d: "=", 0x2e: "~", 0x2f: "`",
         0x30: "{", 0x32: "}", 0x33: "+", 0x34: '*', 0x36: "<", 0x37: ">",
         0x38: "?", 0x87: "_", 0x89: "|"}
        )
hmap = hid_map_jis
smap = shift_map_jis


def decode_hid(hexline: str) -> str:
    global prev_c
    bs = bytes.fromhex(hexline)
    mod, key = bs[0], bs[2]
    c = smap.get(key, "") if mod & (0x02 | 0x20) else hmap.get(key, "")
    if c == prev_c:
        return ""
    prev_c = c
    if not c:
        return ""
    return str(c)


if __name__ == "__main__":
    prev_c = ""
    for line in sys.stdin:
        line = line.rstrip("\n")
        if len(line) == 16:
            print(decode_hid(line), end="")
    print()

```
