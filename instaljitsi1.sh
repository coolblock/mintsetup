
sudo ufw allow OpenSSH
sudo ufw allow http
sudo ufw allow https
sudo ufw allow in 10000:20000/udp
sudo ufw enable
#When you see the prompt Command may disrupt existing ssh connections. Proceed with operation (y|n)?, input y and then press ENTER.

sudo apt update
sudo apt upgrade -y && sudo shutdown -r now
#During the upgrade, you may be informed that the currently installed version of the grub configuration file has been locally modified. Since we are actually not responsible for the modification, #use the UP arrow to highlight the install the package maintainer's version option, and then press ENTER.


