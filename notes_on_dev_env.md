# Creating dev rails environment for meter-man project

```bash
# (optional) Make folder to contain all your work
mkdir meter-man
cd meter-man

# Install your ruby environment
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable
# close your shell, and reopen it
rvm install 2.2.0 # this takes >5min
rvm use 2.2.0
gem install bundle

# Install nodejs (somehow rails needs it)
sudo apt-get install -y nodejs

# Install PostgreSQL
sudo apt-get install -y postgresql libpq-dev

# Configure PostgreSQL
sudo su postgres
psql
create role <UBUNTU USERNAME> login createdb;
<Type Ctl-D>
<Type Ctl-D again>

# Install a good text editor for development
sudo add-apt-repository ppa:webupd8team/atom
sudo apt-get update
sudo apt-get install -y atom

# Get app code
sudo apt-get install -y git
git clone <url/for/your/fork> repo
cd repo/meter-man/
bundle install

# Prepare database for app
# execute this when inside the app folder
rake db:create
rake db:migrate

# Start app server
rails s
# open browser to http://localhost:3000
```
