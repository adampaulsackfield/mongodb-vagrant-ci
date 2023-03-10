echo ---------- Import GPG Key - MongoDB ----------
wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

echo ---------- Update the System ----------
sudo apt-get update -y

echo ---------- Install MongoDB ----------
sudo apt install mongodb-org -y

echo ---------- Start MongoDB ----------
sudo systemctl start mongod.service

echo ---------- Enable MongoDB on Boot ----------
sudo systemctl enable mongod.service

echo ---------- Update Conf ----------
sudo cp /home/vagrant/env/mongodb/mongod.conf /etc/mongod.conf

echo ---------- Restart Mongo Service ----------
sudo systemctl restart mongod.service

echo ---------- Show Status ----------
sudo systemctl status mongod.service

echo ---------- Get Host IP ----------
sudo hostname -I > /home/vagrant/global/hostname.txt
