require File.dirname(__FILE__) + '/test_helper.rb'

class TestGeoip < Test::Unit::TestCase

  def setup
    @dummy = Dummy.new
    @dummy2 = AnotherDummy.new
  end
  
  def test_objects_are_geolocatable
    assert_not_nil @dummy.country if Autometal::Geoip::City.installed?
  end
  
  def test_object_responds_to_organization_if_installed
    assert_not_nil @dummy.organization if Autometal::Geoip::Organization.installed?
  end
  
  def test_gem_can_install_binaries
    assert_nothing_raised do
      Autometal::Geoip::Installer.new("GeoLiteCity")
    end
    assert_equal true, Autometal::Geoip.bin_installed?
    assert_not_nil @dummy.country, "Country should not be nil"
    assert_not_nil @dummy.city, "City should not be nil"
    assert_not_nil @dummy.lat, "Latitude should not be nil"
    assert_not_nil @dummy.lng, "Longitude should not be nil"
  end
  
  def test_can_override_geo_attribute
    assert_equal @dummy.country, @dummy2.country
  end
end
