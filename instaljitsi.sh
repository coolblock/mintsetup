sudo dd if=/dev/zero of=/swapfile count=2048 bs=1M
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile   none    swap    sw    0   0' | sudo tee -a /etc/fstab
free -m

sudo hostnamectl set-hostname jitsimeet
sudo sed -i 's/^127.0.1.1.*$/127.0.1.1 tucson.now.im tucson/g' /etc/hosts

hostname
hostname -f
reboot