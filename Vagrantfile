VAGRANTFILE_API_VERSION = "2"

path = "#{File.dirname(__FILE__)}"

require 'yaml'
require path + '/scripts/rails_box.rb'

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  RailsBox.configure(config, YAML::load(File.read(path + '/config.yaml')))
end