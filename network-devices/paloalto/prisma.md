# Prisma Access
- [Palo Alto Networks Prisma Access SASE Security: Design and Operation (EDU-318)](https://www.trainocate.co.jp/reference/course_details.aspx?code=SCC0561V)
- https://www.paloaltonetworks.jp/sase/ztna
- https://www.hitachi-solutions.co.jp/paloalto/products/cloud/prisma-access.html
- https://docs.paloaltonetworks.com/compatibility-matrix/reference/prisma-access
- https://www.paloaltonetworks.jp/resources/datasheets/prisma-access-licensing-guide
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
# Prisma Access License Types
- https://docs.paloaltonetworks.com/prisma/prisma-access/3-2/prisma-access-panorama-admin/prisma-access-overview/prisma-access-licenses
- https://www.paloaltonetworks.com/apps/pan/public/downloadResource?pagePath=/content/pan/ja_JP/resources/datasheets/prisma-access-licensing-guide
## License Options
- Prisma Access for Mobile User
- Prisma Access for Rmote networks
- Both 1 and 2
- Add-Ons
## Editions
- Business
- Business Premium
- Zero Trust Network Access (ZTNA) Secure Internet Gateway (SIG)
- Enterprise
## Add-Ons Licenses
- Enterprise DLP
- Interconnect
- Additional Service Connections
- [ADEM (Autonomous Digital Experience Management: 自律的デジタルエクスペリエンス管理)](https://www.paloaltonetworks.com/blog/2022/08/operational-issues-solved-by-adem/?lang=ja)
- SaaS Security
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
