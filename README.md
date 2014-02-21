# TeamStatus.TV BTF

Welcome, I'm really happy that you're evaluating our product.

You are just few steps from beautiful dasboard for your project. Simply follow these short and easy installation instruction.

If you have any problems or questions feel free to contact pawel@teamstatus.tv for support.

# Installation

Instructions bellow reference `btf` command which is available in `bin` directory.

## Installing on Mac

The easiest option is to install [Homebrew package manager](http://brew.sh), then use brew to install missing packages.

`brew install mongodb`

`sudo pip install supervisor envdir`

`sudo gem install bundler foreman`

### Installing on Ubuntu 12.x LTS

Run `bin/btf install-deps` to install missing dependencies.

## Installing on Ubuntu 13.x

You should be able to install everything else (mongodb, nginx, etc.) using `apt-get`.

`sudo apt-get install mongodb nginx python-pip`

`sudo pip install supervisor`

`sudo pip install envdir`

`sudo gem install bundler foreman`

## Installing on other Linux distros

You need to have installed following tools to run TeamStatus.TV, check Ubuntu instructions for details, some commands you may re-use.

* git
* node (0.10.x)
* npm
* ruby 2.0
* bundler
* mongodb server
* supervisord
* nginx (>1.5.0)
* envdir (from daemontools or python version http://envdir.readthedocs.org/)

## Installing on Windows

That's not supported. Sorry. We'll be happy to update this section if you wish to contribute a Windows specific instructions.

## Prepare TeamStatus.TV

You need to download missing dependencies that are not distributed with TeamStatus.TV, it's only needed once after installation (also after each update).

To install dependencies run: `btf prepare`

# Configuration

Example configuration is stored in `etc.sample` directory, copy it to `etc` and customize.

Main TeamStatus.TV specific settings are stored in `etc/teamstatus.d`, each setting as a separate file.

If you wish to change base url of the application you should also edit `etc/nginx/nginx.conf`

## MongoDB

On some systems MongoDB doesn't require authentication - so whatever you store in the database will be visible by anyone. TeamStatus.TV encrypts crucial fields (like password) so your data is safe but you probably want to secure the database itself too.

In case you want to secure the database here's how to do it:

* run `mongo` console
* `use teamstatus` (to create the database)
* `db.addUser({user: 'username', pwd: 'password', roles: ['readWrite']})`
* edit `/etc/mongodb.conf` and add `auth = true` (to enable authentication)
* reload MongoDB

## Options

Changing any of these values requires `btf restart`

* MONGODB_URL

	> Database URL

* ENCRYPTED_FIELDS_PASSWORD

	> Password used to encrypt sensitive fields in the database. Must not change after database was initialized. Losing this values will render your database useless.

* COOKIE_SECRET

	> For security reasons you should change this to some random value

* CONSOLE_SECRET

	> For security reasons you should change this to some randome value

* COOKIE_DOMAIN, COOKIE_NAME, RAILS_ENV, NODE_ENV

	> Internal, not to touch

# To run TeamStatus.TV

**Do not run TeamStatus.TV before editing configuration in `etc/teamstatus.d`**

Run: `btf start`

To stop it: `btf stop`

To restart it: `btf restart`

To get current status: `btf status`

# Use it

Open http://localhost:57575/ in your favourite browser and set up a board for your team!
