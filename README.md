# TeamStatus.TV BTF

Welcome, I'm really happy that you're evaluating our product. Here's a short and hopefully easy to follow installation instruction.

If you have any problems or questions feel free to contact pawel@teamstatus.tv for support.

# Installation

## Dependencies

You need to have installed following tools to run TeamStatus.TV

* git
* node (1.10.x)
* npm
* ruby 2.0
* bundler
* mongodb server
* supervisord
* nginx
* envdir (from daemontools or python version http://envdir.readthedocs.org/)

Instructions bellow reference `btf` command which is available in `bin` directory.

## Installing on Mac

The easiest option is to install [Homebrew package manager](http://brew.sh), then use brew to install missing packages.

`brew install mongodb`

`sudo pip install supervisor envdir`

## Installing on Ubuntu

You should be able to install everything else (mongodb, nginx, etc.) using `apt-get`

`sudo apt-get install mongodb nginx python-pip` 

`sudo pip install supervisor`

`sudo pip install envdir`

`sudo gem install bundler`

### Preparing Ubuntu 12.x LTS

Installing missing ruby 2.0

`sudo add-apt-repository ppa:brightbox/ruby-ng-experimental`

`sudo apt-get update`

`sudo apt-get install -y ruby2.0 ruby2.0-dev ruby2.0-doc`

Installing the latest Node.JS

`sudo apt-get install python-software-properties`
 
`sudo apt-add-repository ppa:chris-lea/node.js`
 
`sudo apt-get update`
 
`sudo apt-get install nodejs`

Installing the latest MongoDB

`sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10`

`echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list`

`sudo apt-get update`

`sudo apt-get install mongodb-10gen`

## Installing on Windows

That's not supported. Sorry. We'll be happy to update this section if you wish to contribute a Windows specific instructions.

## Prepare TeamStatus.TV

You need to download missing dependencies that are not distributed with TeamStatus.TV, it's only needed once after installation (also after update).

To install dependencies run: `btf prepare`

# Configuration

Configuration is stored in `etc` directory, TeamStatus.TV specific options are stored in `teamstatus.d`, each option as a separate file.

If you wish to change base url of the application you should also edit `etc/nginx/nginx.conf`

## MongoDB

On some systems MongoDB doesn't require authentication - so whatever you store in the database will be visible by anyone. TeamStatus.TV encrypts crucial fields (like password) but you probably want to secure the database itself too.

In case you want to secure the database here's how to do it:

* run `mongo` console and use `db.addUser(username, password)` to create a user
* edit `/etc/mongodb.conf` and add `auth = true`
* reload MongoDB

## Options

Changing any of these values requires `btf restart`

*	BOARDS_URL and CONSOLE_URL

	> Change them in case you decide to use a different hostname or path

* MONGODB_URL

	> Database URL

* ENCRYPTED_FIELDS_SALT and ENCRYPTED_FIELDS_PASSWORD

	> Password and salt used to encrypt sensitive fields in the database. Must not change after database was initialized. Losing this values will render your.database useless

* COOKIE_SECRET

	> For security reasons you should change this to some random value

* CONSOLE_SECRET

	> For security reasons you should change this to some randome value

* COOKIE_DOMAIN, COOKIE_NAME, STANDALONE, RAILS_ENV, NODE_ENV

	> Internal, not to touch

# To run TeamStatus.TV

**Do not run TeamStatus.TV before editing configuration in `teamstatus.d`**

Run: `btf start`

To stop it: `btf stop`

To restart it: `btf restart`

To get current status: `btf status`
