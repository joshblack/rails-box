# Rails-Box

A Vagrant setup for Rails installations.

## Instructions

1. Install Vagrant and Virtual Box
2. Clone repository into appropriate location
3. Setup your config options in `config.yaml`
4. Go into the directory from the command line and type `vagrant up`
5. Once everything finishes installing, you can run `vagrant ssh` and get into your new Ubuntu Server
6. To access your rails application, just navigate to the folder you specified in the `config.yaml` file and run `bundle install` and then `rails s`. Simply navigate to `localhost:3000` in the browser on your computer and you'll see your rails application is good to go!

### Problems?

- For Windows Users, you may get an error stating:
    - `Please find the VBOXMANAGE Binary and add it to the path environment`
    - In this case, go to your system's environment variable list and change `VBOX_MSI_INSTALL_PATH` to `VBOX_INSTALL_PATH` and that should solve your issues. Just restart your shell after editing the entry
    - Note: you can find the environment variable list on Windows by just typing in the search field for `environment variables` and selecting `Edit the system environment variables`

