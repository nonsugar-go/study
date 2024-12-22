# Apache Bench
- https://dev.classmethod.jp/articles/ab-tutorial/

```bash
sudo dnf install httpd-tools -y
ab -n 100 -c 10 http://192.168.1.111/
```
# Siege
- https://github.com/JoeDog/siege/

```zsh
sudo apt install siege -y
siege -v -r 2 -c 5 https://192.168.1.111/thumb.png
```
