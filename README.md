# How to run Mojolicious app on Scaleway

This page show you how to run a [Mojolicious](http://mojolicious.org/) app on [Scaleway](https://www.scaleway.com/) in a [Docker](https://www.docker.com/) container.

## Requirements
 * You have an account and are logged into cloud.scaleway.com

First you need create and start a new C1 server using the Docker Image.

## Login your server
```
ssh root@< your scaleway server ip >
```
## Build a Mojolicious App Image
```
git clone https://github.com/loorko/MojoWebAppScaleway
cd MojoWebAppScaleway
docker build -t mojo-web-app .
```
## And run it
```
docker run -p 8080 -t -i --name mojo_web_app mojo-web-app
```
## Get the image IP...
```
docker inspect --format '{{ .NetworkSettings.IPAddress }}' mojo_web_app
```
Probably you get:
```
172.17.0.2
```
## Now check the Mojolicious App
```
curl 172.17.0.2:8080

```
You get an HTML answer, somhting like this:
```
<!DOCTYPE html>
<html>
  <head><title>Welcome</title></head>
  <body><h1>Mojolicious</h1>
</body>
</html>
```
## Nginx
### Install Nginx to the server
```
apt-get install nginx
```
### Configure nginx
```
unlink /etc/nginx/sites-enabled/default
cp .overlay/etc/nginx/sites-available/application /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/application /etc/nginx/sites-enabled/
nginx -s reload
```

# And finally
Go to < your scaleway server ip >, and enjoy it.

### If you wanna restore the default operations
```
unlink /etc/nginx/sites-enabled/application
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/
nginx -s reload
```