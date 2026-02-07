# Padding Oracle Attack

- https://openssl-library.org/files/ssl-poodle.pdf
- https://archiv.infsec.ethz.ch/education/fs08/secsem/bleichenbacher98.pdf
## AES

- https://nvlpubs.nist.gov/nistpubs/FIPS/NIST.FIPS.197-upd1.pdf

## PKCS#7パディング

- https://datatracker.ietf.org/doc/html/rfc2315#section-10.3
- https://datatracker.ietf.org/doc/html/rfc5652#section-6.3

## AES256-CBC

Cipher Block Chaining

```plaintext
 IV      C0              C1               C2       
 |       |--------+       |--------+       |       
 |       v        |       v        |       v       
 | Key->[Decrypt] | Key->[Decrypt] | Key->[Decrypt]
 |       |        |       |        |       |       
 +------>⊕        +------>⊕        +------>⊕       
         |                |                |       
         v                v                v       
         P0               P1               P2      
```

P0 := Dec(C0) XOR IV
P1 := Dec(C1) XOR C0
P2 := Dec(C2) XOR C1
