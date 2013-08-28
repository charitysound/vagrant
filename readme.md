### CharitySound Vagrant Development Environment

###### System Requirements:

1. Git
2. Vagrant
3. VirtualBox

###### Installation:

1. Clone the repository with the backend submodules and run the server. This will take a while the first time.

	```
git clone git@github.com:charitysound/vagrant.git vagrant
cd vagrant
git submodule init
git submodule update
vagrant up
```

	> Tip: Use "vagrant halt" instead of "vagrant destroy" when powering off the virtual machine. This will prevent the installation process from happening concurrent times.

2. Copy distributed configuration files, and update values.

	```
cd backend
cp config.json.dist config.json
cp app/config/database.php.dist app/config/database.php
```

3. SSH into the server and install the application.

	```
vagrant ssh
cd /var/www/backend
composer install
npm install
grunt
```
