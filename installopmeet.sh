cd
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 5AFA7A83

#deb [arch=amd64] http://ubuntu.openvidu.io/6.10.0 bionic kms6
#deb [arch=amd64] http://mirror.yandex.ru/ubuntu/ bionic main restricted
#deb [arch=amd64] http://mirror.yandex.ru/ubuntu/ bionic universe

sudo apt-get update && sudo apt-get install --yes kurento-media-server


apt install openjdk-8-jre-headless -y


#sudo add-apt-repository --yes ppa:webupd8team/java
#sudo apt-get install oracle-java8-installer -y
java -version
sudo apt-get install imagemagick ghostscript libxt6 libxrender1 ffmpeg sox -y

# Download and Install the Latest Updates for the OS
apt-get update && apt-get upgrade -y

# Set the Server Timezone to CST
echo "America/Chicago" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# Enable Ubuntu Firewall and allow SSH & MySQL Ports
ufw enable
ufw allow 22
ufw allow 3306

# Install essential packages
apt-get -y install zsh htop

# Install MySQL Server in a Non-Interactive mode. Default root password will be "root"
echo "mysql-server-5.6 mysql-server/root_password password root" | sudo debconf-set-selections
echo "mysql-server-5.6 mysql-server/root_password_again password root" | sudo debconf-set-selections
sudo apt-get install mysql-server -y

# Run the MySQL Secure Installation wizard
mysql_secure_installation

sed -i 's/127\.0\.0\.1/0\.0\.0\.0/g' /etc/mysql/my.cnf
mysql -uroot -proot -e 'USE mysql; UPDATE `user` SET `Host`="%" WHERE `User`="root" AND `Host`="localhost"; DELETE FROM `user` WHERE `Host` != "%" AND `User`="root"; FLUSH PRIVILEGES;'

service mysql restart





mysql -uroot -proot -e 'CREATE DATABASE openmeetings;'
mysql -uroot -proot -e 'CREATE USER openmeetings;'
mysql -uroot -proot -e "GRANT ALL PRIVILEGES ON openmeetings.* TO 'openmeetings'@'localhost' IDENTIFIED BY 'password';"
mysql -uroot -proot -e 'FLUSH PRIVILEGES;'

#MariaDB [(none)]> \q



wget https://downloads.apache.org/openmeetings/4.0.10/bin/apache-openmeetings-4.0.10.tar.gz
mkdir /opt/openmeetings
sudo tar xvf apache-openmeetings-4.0.10.tar.gz -C /opt/openmeetings
cd /opt/openmeetings
sudo sh red5.sh openmeetings





