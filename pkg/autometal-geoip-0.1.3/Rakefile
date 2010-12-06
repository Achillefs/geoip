require 'rubygems'
gem 'hoe', '>= 2.1.0'
require 'hoe'
require 'fileutils'
require './lib/geoip'

Hoe.plugin :newgem
$hoe = Hoe.spec 'autometal-geoip' do
  self.developer 'Achillefs Charmpilas', 'ac@humbuckercode.co.uk'
  self.post_install_message = File.read('PostInstall.txt')
  self.rubyforge_name       = self.name
  self.extra_deps           = [['activesupport','>= 0']]
end

require 'newgem/tasks'
Dir['tasks/**/*.rake'].each { |t| load t }
