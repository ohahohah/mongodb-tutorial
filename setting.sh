# Import the public key used by the package management system
sudo apt-get install gnupg
wget -qO - https://www.mongodb.org/static/pgp/server-5.0.asc | sudo apt-key add -

# Install Mongodb
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu bionic/mongodb-org/5.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-5.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org=5.0.2 mongodb-org-database=5.0.2 mongodb-org-server=5.0.2 mongodb-org-shell=5.0.2 mongodb-org-mongos=5.0.2 mongodb-org-tools=5.0.2
sudo mkdir -p /data/db

# get mongodb config file
wget https://raw.githubusercontent.com/ohahohah/mongodb-tutorial/main/mongod.conf

# Run Mongodb
sudo service mongod start
echo '========================processing========================mongod start'
sleep 15

# setting - create user
mongo admin --eval 'db.createUser({user: "myuser", pwd: "mypassword", roles:["root"]});'

# replace config - bindip,security 
cat /root/mongod.conf > /etc/mongod.conf

# restart mongodb
sudo service mongod stop
sudo service mongod start
sleep 15
netstat -tnlp



 

