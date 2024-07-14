# SOLID Principles / SOLID 原則
- https://en.wikipedia.org/wiki/SOLID
- http://www.butunclebob.com/ArticleS.UncleBob.PrinciplesOfOod
- https://en.wikipedia.org/wiki/Barbara_Liskov
- [イラストで理解するSOLID原則 #初心者 - Qiita](https://qiita.com/baby-degu/items/d058a62f145235a0f007)

# Single Responsibility Principle (SRP) / 単一責任の原則
- A class should have only one reason to change
  - Should have only one responsibility
  - Classes with multiple responsibilities break when changed
  - Put each responsibility in a separate class

クラスはたったひとつのアクターに対して責務を負うべきである
⇒ アクターが異なるクラウスはアクターごとに分割すべき

> [!NOTE]
> DRY の原則
> - Don't Repeat Yourself
> - コードの繰り返しを避けるという内容の原則
> - DRY にすべきは概念の単位
>   - 同じ用なロジックであっても、概念が違うものは DRY にすべきではない
# Open Closed Principle (OCP) / オープンクローズドの原則
- Modules should be open for extension but closed for modification
  - Modification to existing code leads to bugs and causes the software to break
  - It should be possible to change behavior of existing code without modification
  - Instead the behavior should be changed by adding new code
  - Cornerstone of good design
  - Use design patterns

ソフトウェアの構成要素は拡張に対して開かれていて、修正に対して閉じていなければならない
# Liskov Substitution Principle (LSP) / リスコフの置換原則
- Subtypes must be substitutable for their base types
  - Applies to inheritance relationship
  - The inheritance relationship should be based on behavior
  - A subclass must have all the behaviors of its base type & must not remove or chage its parent behavior
  - This allows a subclass to replace its base type in code
  - New subclasses can be added without modifying existing code
# Interface Segregation Principle (ISP) / インターフェース分離の原則
- Clients should not be forced to depend on methods they do not use
  - An interface with too many methods will be complex to use (called fat interface)
  - Some clients may not use all the methods
    - but will be forced to depend on them
  - Separate the interface and put methods based on the client usage
# Depencency Inversion Principle (DIP) / 依存性逆転の原則
- Abstractions should not depend on details. Details should depend on abstractions
  - Abstraction means an interface and details mean classes
  - Using a concreate class directly creates a dependency
  - Software becomes difficult to modify
  - Invert the dependency by using an interface rather a concrete class
