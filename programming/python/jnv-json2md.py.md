**jnv-json2md.py**

```python
#!/usr/bin/env python3
import json
import requests
import sys
url = "https://jvndb.jvn.jp/myjvn?method=getAlertList&feed=hnd&ft=json"
response = requests.get(url)
data = response.json()
md = []
for e in data["feed"]["entry"]:
    md.append(f"## {e['title']}")
    md.append(f"- **ID:** {e['id']}")
    md.append(f"- **Category:** {e['category']['label']}")
    md.append(f"- **Updated:** {e['update']}")
    for item in e.get("sec:items", []):
        it = item["sec:item"]
        md.append(f"  - **{it['sec:title']}**")
        md.append(f"    - Link: {it['sec:link']}")
    md.append("")
print("\n".join(md))
```
