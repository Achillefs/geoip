%W[ stringio test/unit open-uri #{File.dirname(__FILE__)}/../lib/geoip ].each { |r| require r }

class Dummy
  include Autometal::Geolocatable
  attr_accessor :ip
  
  def initialize
    @ip = open("http://check-rankings.co.uk").read rescue "66.102.13.105"
  end
end