debian-srv-admin
================

Debian GNU/Linux on own internet server. Self-made better init.d scripts+. Self-made secure DNS and SSH setups.

Login 
=======

The only username permitted to login is in `home` directory. Splitter script in `$HOME/.profile` there allows further selection of real for-shell-login user and password authentication. This setup is done by sshd on any rendom TCP port. By default ssh://hostname:22 is fully dummy sshd service.
