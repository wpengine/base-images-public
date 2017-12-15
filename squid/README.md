# squid

An ubuntu 16.04 docker image with squid 3.5 installed.

Running:

```
docker run --name squid -p 127.0.0.1:3128:3128 -d wpengine/squid
docker exec -it squid tail -f /var/log/squid/access.log

curl -v -k -x localhost:3128 -L https://wpengine.com
```

Should allow you to see the connections going through squid.
