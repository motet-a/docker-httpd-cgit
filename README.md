# docker-httpd-cgit

A Docker image for [cgit](https://git.zx2c4.com/cgit/) with Apache
httpd.

Build it with `./build.sh`. The created image name is `http-cgit`.

`cgit` is compiled inside a temporary build image and then copied into
a ligther production image. It is probably overkill since we can also
do everything in the same image and uninstall build dependencies after
the complation, but it's fun to see this little hack working :-)

You have to setup a volume to fill the directory `/var/cgit-repos/`
with the list of the bare Git repositories to be served. It's easy to
do with a `docker-compose.yml`:

```yml
version: '2'
services:

  httpd-cgit:
    image: httpd-cgit
    volumes:
      - ./repos-on-the-host:/var/cgit-repos
    ports:
      - "3000:80"
```
