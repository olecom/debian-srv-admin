#!/bin/sh
# "$HOME/.profile" for secured, nice and wise re-login (fuck PAMela!)

# all signals from controlling tty can kill commands and leave
# user with an interractive shell; prupose of this script to force
# authentification of the real user from this "for login" one

# thus, setting off interractivity (off contolling tty) and setting on
# error checking (any errors -- logout, works only with `+i')

# "/etc/passwd" can have this file as login shell, $HOME can have only
# this file, thus making things easier

# BEWARE, that NO login/password information can be written
# here, because exec-only (no read permission) scripts are not supported.
# Also make sure, that any other login shell for this account must source
# this file, thus making all working securely.

set +i -e
sleep 02
umask 027
cd /

[ "$LC_INTERACT" ] || exec /usr/lib/openssh/sftp-server

U=`
T=50
P="Enter user name, please ("
G=$((${#P}+1))

exec 9<&0
( read U && echo "$U" ) <&9&
PID=$!
exec 9<&- 1>&2

echo -n "$P$T): "
trap 'kill -KILL "$PID" 2>&-' 0 INT QUIT
P=5
while sleep "0.$P" && test -e "/proc/$PID/exe"
do
   T=$(($T-$P))
     if test "$T" -gt 0
   then printf "\0337\033[${G}G$T): \0338"
   else printf "\033[${G}Gtime is out). Bye.
"
	exit 73
     fi
done`
echo "Wait, please..."
B="["`LANG=C date`"] In door
"
sleep 2
mail -s "Puff in the Hole via [$U]" root <<!E
$B
!E
[ "$SSH_ORIGINAL_COMMAND" ] || case "${U:=}" in
    root|'')
	exec sleep $((1<<30));;
    *)  # check and `su` to the supplied login 
	if test -d "/home/$U" && chmod 660 `tty`
	then 
	B=$B"["`LANG=C date`"] User OK. Making SU...
"
	mail -s "Puff in the Hole via [$U]" "$U" <<!E
$B
!E
	su "$U" &&
B=$B"["`LANG=C date`"] Logout." || B=$B"["`LANG=C date`"] Auth fail, logout."
	else B=$B"["`LANG=C date`"] Bad login:'$U'."
	fi
	mail -s "Puff in the Hole via [$U]" root <<!E
$B
!E
	[ "olecom" = "$U" ] || mail -s "Puff in the Hole via [$U]" "$U" <<!E
$B
!E
	exit 0
;;
esac
echo "Only interactive shell access is available. No commands, please."
exit 73 # termporal (obscure) failure, not reached
