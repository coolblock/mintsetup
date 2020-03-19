sudo apt install -y openjdk-8-jre-headless
java -version
echo "JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:bin/java::")" | sudo tee -a /etc/profile
source /etc/profile

sudo apt install -y nginx
sudo systemctl start nginx.service
sudo systemctl enable nginx.service

cd
wget -qO - https://download.jitsi.org/jitsi-key.gpg.key | sudo apt-key add -
sudo sh -c "echo 'deb https://download.jitsi.org stable/' > /etc/apt/sources.list.d/jitsi-stable.list"
sudo apt update -y

sudo apt install -y jitsi-meet

#When you are asked about the SSL certificate, highlight the Generate a new self-signed certificate (You will later get a chance to obtain a Let's Encrypt certificate) option and then press ENTER.

sudo /usr/share/jitsi-meet/scripts/install-letsencrypt-cert.sh

