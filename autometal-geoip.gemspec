# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{autometal-geoip}
  s.version = "0.2.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Achillefs Charmpilas"]
  s.date = %q{2010-12-07}
  s.default_executable = %q{install_geoip}
  s.description = %q{A wrapper to MaxMind's GeoIP services, that can work with both free and paid versions.
Also provides geo-location methods to Active Record and Sequel Models.

This product includes GeoLite data created by MaxMind, available from http://www.maxmind.com/.}
  s.email = ["ac@humbuckercode.co.uk"]
  s.executables = ["install_geoip"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "PostInstall.txt"]
  s.files = ["History.txt", "Manifest.txt", "PostInstall.txt", "README.rdoc", "Rakefile", "autometal-geoip.gemspec", "bin/install_geoip", "lib/geoip.rb", "lib/geoip/city.rb", "lib/geoip/geolocatable.rb", "lib/geoip/installer.rb", "lib/geoip/organization.rb", "script/console", "script/destroy", "script/generate", "shellscripts/install_binary", "shellscripts/install_db", "test/test_geoip.rb", "test/test_helper.rb"]
  s.homepage = %q{http://github.com/Achillefs/geoip}
  s.post_install_message = %q{
Thank you for installing autometal-geoip

Please run +sudo install_geoip+ to install the MaxMind binaries

For more information on autometal-geoip, see http://humbuckercode.co.uk/licks/gems/geoip/

}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{autometal-geoip}
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{A wrapper to MaxMind's GeoIP services, that can work with both free and paid versions}
  s.test_files = ["test/test_geoip.rb", "test/test_helper.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>, [">= 0"])
      s.add_development_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_development_dependency(%q<hoe>, [">= 2.6.2"])
    else
      s.add_dependency(%q<activesupport>, [">= 0"])
      s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
      s.add_dependency(%q<hoe>, [">= 2.6.2"])
    end
  else
    s.add_dependency(%q<activesupport>, [">= 0"])
    s.add_dependency(%q<rubyforge>, [">= 2.0.4"])
    s.add_dependency(%q<hoe>, [">= 2.6.2"])
  end
end
