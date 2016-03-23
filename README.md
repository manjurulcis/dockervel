#Dockervel
##A complete Laravel development environment in Docker Containers:

* Bring Up a Laravel development environment with a single command easy as `dup`
* Execute Artisan commands easy as  `dartisan make:auth`
* Run Composer command easy as `dcomposer update`
* Run NodeJS script easy as `dnodejs npm install`
* Run gulp watch easy as `dgulp-watch`
* Containers managed with docker-compose
* Lightweight as it is mostly based in Linux Alpine base image of 5MB.
* Runs behind an nginx reverse proxy so multiple sites/containers can be running at once

###Containers included
* Nginx 1.8.1 & PHP 5.5.9-1ubuntu4.14 & Composer running in Ubuntu
* Offical MySQL container
* Redis running in Alpine
* Artisan running in Debian (Alpine is missing some PHP packages)
* NodeJS with gulp, grunt and bower -g installed in official node:4.2.2-slim base image
* Volumes mounted as containers


## Usage

Make sure you have `docker` and `docker-compose` installed.

* clone this repo: `git clone https://github.com/Webscope/dockervel.git`
* cd in: `cd dockervel`
* run as su: `su`
* add aliases: `. ./scripts/aliases.sh`
* optionally change the VIRTUAL_HOST in docker-compose.yml
* run `dstart`
and you have a server running! Hit [http://laravel.docker.local](http://laravel.docker.local) (or the VIRTUAL_HOST you defined in docker-compose.yml) in your browser and you will see nginx fault message because there is no `www/public/index.php`.
* create new Laravel project: `dcomposer-create`
* fix permissions: `dpermit`
* copy the .env file `cp .env www/.env`
* run artisan commands: `dartisan make:auth`
* fix permissions: `dpermit`
Now you have a registration system active. Go to [http://laravel.docker.local](http://laravel.docker.local) (or the VIRTUAL_HOST you defined in docker-compose.yml) and register a new user to see that db's are running ok.
* npm install: `dnodejs npm install`
* gulp install: `dnodejs gulp install`
* gulp watch: `dulp-watch`
Now there is one container running `gulp watch` and monitors changes on files according your `gulpfile.js`  
* For shell access to the web server, use `dsh`


## Aliases
aliases.sh contains shortcuts to common commands.
run dot space dot /scripts/aliases.sh to activate aliases for this terminal session.
```
$ . ./scripts/aliases.sh
```
and now for this terminal session you have aliases like `dartisan`, `dcomposer`, `dnodejs`, `dup`, `dstop`.

If you don't want to work with aliases, open the script and see the coressponding commands next to each alias.
In the following document it is supposed that you have executed `aliases.sh` as `su` and you have the aliases active.

### Create new Laravel Project
* create new laravel project: `dcomposer-create`
* type `localhost` in your browser and you see the Laravel welcome screen

### Fix permissions
since containers have different user in them, you have to change the permisions in www/ folder to be able to write. type:
```
$ dpermit
```
it will simply `chmod -R 777 www`
Remember to run `dpermit` after each time the `www` folder has a new file.

### Configure Laravel for mysql
Copy the .env file to Laravel
```
cp .env www/.env
```
### Configure Laravel for redis
change `REDIS_HOST` in `.env` to point to `predis`. This is the name that it is used in docker-compose.yml (`link: -redis:predis`).
```
REDIS_HOST=predis
REDIS_PASSWORD=null
REDIS_PORT=6379
```
in Laravel 5.2 there are some issues with `redis` namespace, so to avoid conflicts `predis` is used.
Also you have to change /config/app.php, and replace:
```
'Redis'     => Illuminate\Support\Facades\Redis::class,
```
with
```
'LaravelRedis'     => Illuminate\Support\Facades\Redis::class,
```
Use it like:
```
$redis = LaravelRedis::connection();
$redis->set('name', 'myname');
$redis->get('name');
```

### Running Artisan commands
type `dartisan ` followed by an artisan command
```
example:
$ dartisan make:auth
$ dartisan migrate
$ dartisan tinker
```
### Running composer commands
type `dcomposer ` followed by a composer command
```
example:
$ dcomposer update
$ dcomposer require predis/predis
```
### Nodejs
to install node modules in your project run
```
$ dnodejs npm install
```

### Gulp
install gulp with:
```
dnodejs gulp install:
```

run gulp once:
```
dgulp
```

add gulp watch:
```
dgulp-watch
```

## Size

The size of images is about 750 MB:
```
* front:     70.05 MB
* mysql:    199.50 MB
* redis:      8.50 MB
* composer: 236.80 MB
* nodejs:    36.09 MB
* artisan   208.80 MB
```
The base memory usage for the containers of the server running is about 110 MB.
```
* front: 18 MB
* mysql: 97 MB
* redis:  1 MB
```

## Credits
Based on [https://github.com/SpiralOutDotEu/dockervel](https://github.com/SpiralOutDotEu/dockervel)