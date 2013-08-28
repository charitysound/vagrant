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

	> Tip: Use "vagrant halt" instead of "vagrant destroy" when powering off the virtual machine. This will prevent the initial installation process from happening each time.

2. Copy distributed configuration files, and update values.

	```
cd /var/www/backend
cp config.json.dist config.json
cp app/config/database.php.dist app/config/database.php
```

3. SSH into the server, install the application, migrate and seed the database.

	```
vagrant ssh
cd /var/www/backend
composer install
npm install
php artisan migrate
php artisan db:seed
```

4. Create a hostname pointing to the Vagrant VM's IP:

	> 192.168.0.37 backend.charitysound.dev
	

###### Development Procedures

**For developing on the backend application, see the [readme](https://github.com/charitysound/backend/blob/master/readme.md), and remember:**

* Certain comamnds, such as artisan, npm, and composer, must be run from with the Vagrant VM. Git operations and file editing may be performed from either your host or the Vagrant VM.

* The backend directory contains a submodule repository of https://github.com/charitysound/backend, and is synced with /var/www/backend on the Vagrant VM. **Any changes to the backend application require git operations be performed from within the backend submodule directory**, from either your host the Vagrant VM. 

[Click here to view the backend application readme.](https://github.com/charitysound/backend/blob/master/readme.md)
