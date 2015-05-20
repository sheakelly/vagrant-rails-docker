echo "proxy: $http_proxy"

# The output of all these installation steps is noisy. With this utility the progress report is nice and concise.
function install {
  echo installing $1
  shift
  #sudo apt-get -y install "$@" --force-yes>/dev/null 2>&1
  sudo apt-get -y install "$@" --force-yes
}

# enable console colors
sed -i '1iforce_color_prompt=yes' ~/.bashrc

# disable docs during gem install
echo 'gem: --no-rdoc --no-ri' >> ~/.gemrc

echo updating package information
sudo apt-add-repository -y ppa:brightbox/ruby-ng >/dev/null 2>&1
sudo apt-get -y update >/dev/null 2>&1
sudo apt-get -y update

install 'essentials' autoconf bison build-essential libssl-dev libyaml-dev libreadline6 libreadline6-dev zlib1g zlib1g-dev libcurl4-openssl-dev curl wget

install 'ruby' ruby2.2 ruby2.2-dev
sudo update-alternatives --set ruby /usr/bin/ruby2.2>/dev/null 2>&1
sudo update-alternatives --set gem /usr/bin/gem2.2 >/dev/null 2>&1

install 'git' git
#install 'sqlite3' libsqlite3-dev
install 'nodejs' nodejs

# Qt and xvfb-run for Capybara Webkit
#sudo apt-get install -y libqtwebkit-dev xvfb

# ImageMagick and Rmagick
#sudo apt-get install -y imagemagick libmagickwand-dev

#install 'postgresql' postgresql postgresql-contrib libpq-dev
install 'postgresql' libpq-dev
#sudo -u postgres createuser --superuser vagrant

#install 'memcached' memcached
#install 'redis' redis-server

#gem install rails 4.2.1

# Phantomjs
#sudo wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 -P /usr/local/share --quiet
#sudo tar xjf /usr/local/share/phantomjs-1.9.7-linux-x86_64.tar.bz2 -C /usr/local/share
#sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
#sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
#sudo ln -s /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

# cleanup
sudo apt-get clean

sudo gem sources -a http://gem.nib.com.au/

#cd /vagrant
#bundle install
#rbenv rehash

#Create database
#cp -R config/database.sample.yml config/database.yml
#rake db:create
#rake db:migrate
#rake db:seed
