# Creating dev rails environment for meter-man project

```bash
# make folder to contain all your work
mkdir meter-man
cd meter-man

# install your ruby environment
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
# close your shell, and reopen it
rvm install 2.2.0 # this takes >5min
rvm use 2.2.0
gem install bundle

# install mongodb
echo "deb http://repo.mongodb.org/apt/debian wheezy/mongodb-org/3.0 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list
sudo apt-get update
sudo apt-get install -y mongodb-org

# install nodejs (somehow rails needs it)
sudo apt-get install -y nodejs

# get app code
sudo apt-get install -y git
git clone <url/for/your/fork> repo
cd repo/meter-man/
bundle install

# start app
# once you're already inside the app folder
mongod &
rails s
# open browser to http://localhost:3000
```
