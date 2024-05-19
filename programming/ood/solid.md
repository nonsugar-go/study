# SOLID Principles / SOLID 原則

- Single Responsibility Principle / 単一責任の原則
- Open Closed Principle / オープンクローズドの原則
- Liskov Substitution Principle / リスコフの置換原則
- Interface Segregation Principle / インターフェース分離の原則
- Depencency Inversion Principle / 依存性逆転の原則

# Single Responsibility Principle / 単一責任の原則
クラスはたったひとつのアクターに対して責務を負うべきである
⇒ アクターが異なるクラウスはアクターごとに分割すべき

> [!NOTE]
> DRY の原則
> - Don't Repeat Yourself
> - コードの繰り返しを避けるという内容の原則
> - DRY にすべきは概念の単位
>   - 同じ用なロジックであっても、概念が違うものは DRY にすべきではない
