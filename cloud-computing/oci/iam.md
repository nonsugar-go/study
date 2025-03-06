# IAM
# Policy
```
Allow group 'Procution'/'NetworkAdmin' to manage virtual-network-family in compartment Sandbox
```
## Actions句
```mermaid
flowchart LR

Start --> verb
verb --> Any-resource
verb --> Resouce_Kind
Any-resource --> End
Resouce_Kind --> End
```

動詞|アクセスのタイプ|権限の例
--|--|--
inspect|監査、列挙、監視|inspect objects
read|変更しない|read objects
use|変更する|use objects
manage|何かをする権限|manage objects
