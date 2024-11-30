# Prisma Access
- https://www.paloaltonetworks.jp/sase/ztna
- https://www.hitachi-solutions.co.jp/paloalto/products/cloud/prisma-access.html
# Secure Access Service Edge (SASE)
- Cloud Security Web Gateway (SWG)
- Firewall As a Service (FWaas)
- Cloud Access Security Broker (CASB)
- Zero Trust Network Access (ZTNA)
- Software-defined WAN (SD-WAN)
- DNS security
- Network sandbox
- Remote browser isolation
- Support for managed and unmanaged devices
# Prisma Access - Service Infrastructure subnet
- 169.254.169.253, 169.254.169.254
- 100.64.0.0/10 - RFC6890で定義されたShared Address Space
- 169.254.201.0/24
- 169.254.202.0/24
# 用語
1. **SC-CAN (Service Connection - Corporate Access Node)**:
   - **Service Connection (SC)** は、企業の内部リソースへのアクセスを提供するための接続です。これにより、リモートネットワークやモバイルユーザーが企業のデータセンターや本社のリソースにアクセスできるようになります。
   - **Corporate Access Node (CAN)** は、サービス接続の別名で、企業の内部リソースへのアクセスを提供するノードです。

2. **RN-SPN (Remote Network - Security Processing Node)**:
   - **Remote Network (RN)** は、企業のリモートオフィスや支店などのネットワークを指します。これらのネットワークは、Prisma Access を通じてセキュアに接続されます。
   - **Security Processing Node (SPN)** は、セキュリティ処理を行うノードで、リモートネットワークやモバイルユーザーのトラフィックを処理します。
