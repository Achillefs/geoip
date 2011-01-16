%W[ stringio test/unit open-uri #{File.dirname(__FILE__)}/../lib/geoip ].each { |r| require r }

class Dummy
  include Autometal::Geolocatable
  attr_accessor :ip
  
  def initialize
    @ip = open("http://check-rankings.co.uk").read rescue "66.102.13.105"
  end
end

class AnotherDummy
  include Autometal::Geolocatable
  attr_accessor :pantera
  
  def initialize
    @pantera = open("http://check-rankings.co.uk").read rescue "66.102.13.105"
  end
  def geo_attr; pantera; end
end

module Autometal
  class StubbedGeoip < Geoip
    BIN = "zoot-allures.666"
  end
end