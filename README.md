# Rails-Box

A Vagrant setup for Rails installations.

## Instructions

1. Install Vagrant and Virtual Box
2. Clone repository into appropriate location
3. Go into the directory and run `vagrant up`. (This will install the base linux box)
4. In the same directory, run `vagrant ssh` to connect to your new ubuntu server
5. After connecting, cd into `/vagrant/scripts/` and run `bash ./boot.sh` (This installs all our dependencies)
6. After that's complete, cd into ~ (or /home/vagrant) and run `chsh -s /bin/zsh`
7. Exit out of the ubuntu box and then log back in (using `vagrant ssh`)
8. You're good to go!
