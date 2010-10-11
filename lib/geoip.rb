$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

%W[installer geolocatable].each { |r| require "#{File.dirname(__FILE__)}/geoip/#{r}" } 

module Autometal
  class Geoip
    VERSION = '0.1.2'
    DEFAULT_PACKAGE = "GeoLiteCity"
    DATA_FILE_PATH = "/usr/local/share/GeoIP/"
    BIN = "geoiplookup"
    
    def self.bin_installed?
      %x{ #{BIN} --version } == "" ? false : true
    end
    
    def initialize ip_or_domain, opts = {}
      raise LoadError.new("No GeoIP binary is installed on your system.") unless self.class.bin_installed?
      package = opts.delete(:package) || DEFAULT_PACKAGE
      @data_file = File.join(DATA_FILE_PATH,"#{package}.dat")
      @response = self.lookup ip_or_domain
      ar = @response.split(", ")
      @version = ar[0]
      @country = ar[1].gsub("Rev 1: ","")
      @county = ar[2]
      @city = ar[3]
      @lat = ar[5].to_f
      @lng = ar[6].to_f
    end
    attr_accessor :country, :county, :city, :lat, :lng
    def lookup ip_or_domain
      %x{ #{BIN} -f #{@data_file} #{ip_or_domain} }
    end
    
    def latlng
      [self.lat,self.lng]
    end
    alias :latlon :latlng
  end
end