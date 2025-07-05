# Calling Conventions
- [呼出規約](https://ja.wikipedia.org/wiki/%E5%91%BC%E5%87%BA%E8%A6%8F%E7%B4%84)
- https://docs.microsoft.com/ja-jp/cpp/build/x64-calling-convention
- https://qiita.com/CRUD5th/items/8eec9ee022b843c05e99
- https://wiki.osdev.org/System_V_ABI

# System V AMD64 ABI
- 整数・ポインタ引数 - RDI, RSI, RDX, RCX, R8, R9
- 戻り値 - RAX
- システムコールでは RCX の代わりに R10 を使用
- レジスタだけでは引数の数が不足する場合はスタックを利用。

- System V ABIでは、関数を呼び出す前にスタックは16バイト（128ビット）アラインメントされている必要があると規定されている。ただし、push命令はスタックポインタ（RSP）を8バイトだけデクリメントするので、この命令1つではスタックが16バイトアラインされている保証はない。16バイトアラインメントを維持したい場合は、pushの前後にスタック操作を調整する必要がある。余分なsub rsp, 8などを入れてアラインメントを再調整することがある。

# Windows ABI (Microsoft x64 calling convention)
