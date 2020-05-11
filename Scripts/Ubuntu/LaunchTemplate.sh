#!/bin/bash
# Provided under MIT Licence
# https://github.com/nosseb/Ehwaz
version="2.0"

cat > /home/ubuntu/password.txt << EOM
server_name myServerName
server_password myServerPassword
admin_password myAdminPassword
command_password myCommandPassword
EOM
chown ubuntu:ubuntu /home/ubuntu/password.txt
#TODO: change dev url
curl https://raw.githubusercontent.com/nosseb/Ehwaz/Ubik/Scripts/Ubuntu/AutoSetup.sh --output /home/ubuntu/AutoSetup.sh
chmod +x /home/ubuntu/AutoSetup.sh
sudo bash /home/ubuntu/AutoSetup.sh Volume-ID
touch /home/ubuntu/.setup_complete