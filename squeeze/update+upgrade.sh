#!/bin/sh

apt-get update && apt-get upgrade && {

/etc/init.d/apache2 stop
/etc/init.d/mysql stop

/etc/bind/bind9+ stop start
/etc/ssh/ssh+ reload_main
/etc/ssh/ssh+hosting reload_main
}
