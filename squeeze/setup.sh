#: || {
# - simple used setup
# - log door entering via e-mail

apt-get install bind9 dnsutils \
apache2 libapache2-mod-php5 \
mysql-server phpmyadmin \
at mutt unzip bzip2 xfsprogs most screen nginx

exit

# ********
adduser --uid 19810702 --ingroup root olecom
# groups
usermod -G tty olecom
usermod -G www-data -a olecom
usermod -G root -a olecom
# :like
#usermod -G tty lucky
#usermod -G www-data -a lucky
#usermod -G root -a lucky
# fuck-up-dude, root:root # new pass:super_d@la-wants-thi$-as$_2011 old:myzHole-in-as$_smells_good
adduser --force-badname --ingroup nogroup 'Hole-in-as$'

# mysql: root:root, likeby:likeby
#pure-ftpd \

# check mail transfer: exim -bt root@like.by
dpkg-reconfigure exim4-config

# must be "ru_RU.UTF-8"
dpkg-reconfigure locales

# make proxy user set
#mkdir /home/proxy
#chown proxy:root /home/proxy
#chmod 500 /home/proxy/

# upgrade exim4 hole from backports
#apt-get -t squeeze-backports install exim4='4.72-6~bpo50+1' exim4-base='4.72-6~bpo50+1' exim4-daemon-light='4.72-6~bpo50+1'
# check system time: `ntpq -p`
apt-get install ntp
# setup azemel
set -x
U=azemel
adduser --uid 19820414 --ingroup root "$U"
# groups
usermod -G tty "$U"
usermod -G www-data -a "$U"
usermod -G root -a "$U"
# to get files via sftp
usermod -G nogroup -a "$U"
echo "$U@gmail.com" >"/home/$U/.forward"
#}
#apt-get -t squeeze-backports install php5='5.2.6.dfsg.1-1+lenny12'  perl='5.10.0-19lenny5'  curl='7.18.2-8lenny5' bind9='1:9.6.ESV.R4+dfsg-0+lenny3'

#ssh hosting users must be in this group
adduser dela.by www-data
apt-get install gcc libssl-dev make
