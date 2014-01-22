# TeamStatus.TV BTF

Welcome, I'm really happy that you're evaluating our product. Here's a short and hopefully easy to follow installation instruction.

If you have any problems or questions feel free to contact pawel@teamstatus.tv for support.

# Installation

## Dependencies

You need to have installed following tools to run TeamStatus.TV

* node (1.10.x)
* npm
* ruby 2.0
* mongodb server
* supervisord
* nginx
* envdir (from daemontools or python version http://envdir.readthedocs.org/)

Instructions bellow reference `btf` command which is available in `bin` directory.

## Installing on Mac

The easiest option is to install [Homebrew package manager](http://brew.sh), then use brew to install missing packages.

To install supervisord use: `sudo pip install supervisord`

To install envdir use: `sudo pip install envdir`

## Installing on Ubuntu

You should be able to install everything using `apt-get`

To install supervisord use: `pip install supervisord`

To install envdir use: `sudo pip install envdir`

## Installing on Windows

That's not supported. Sorry. We'll be happy to update this section if you wish to contribute a Windows specific instructions.

## Prepare TeamStatus.TV

You need to download missing dependencies that are not distributed with TeamStatus.TV, it's only needed once after installation (also after update).

To install dependencies run: `btf prepare`

# Configuration

Configuration is stored in `etc` directory, you should edit and customize `teamstatus.conf` file.

If you wish to change base url of the application you should also edit `etc/nginx/nginx.conf`

## Options

Changing any of these values requires btf restart

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

**Do not run TeamStatus.TV before editing `teamstatus.conf`**

Run: `btf start`

To stop it: `btf stop`

To restart it: `btf restart`

To get current status: `btf status`
