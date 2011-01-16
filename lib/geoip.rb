$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Autometal
  class Geoip
    VERSION = '0.4.0'
    DATA_FILE_PATH = "/usr/local/share/GeoIP/"
    BIN = "geoiplookup"
    def initialize ip_or_domain
      @org = Organization.new(ip_or_domain) if Organization.installed?
      @geo = City.new(ip_or_domain) if City.installed?
    end
    
    def method_missing(m, *args, &block)
      return @org.send(m, *args, &block) if @org and @org.respond_to?(m)
      return @geo.send(m, *args, &block) if @geo and @geo.respond_to?(m)
    end
    
    def self.bin_installed?
      File.exists?(%x{ which #{self::BIN} }.strip)
    end
=begin rdoc
  Extensible class that uses the Geoip binaries and data files to geolocate IPs and Hostnames.
  To extend it to use a database, you will need to subclass Geoip::Package, define process_response, and self.data_file
  
  See geoip/city.rb and geoip/organization.rb for extension examples
=end
    class Package
      attr_accessor :version
      def initialize ip_or_domain
        return false unless self.class.installed?
        @response = self.lookup ip_or_domain
        process_response
      end
      
      def process_response
        # deine this in the extension models
      end
      
      def self.data_file
        
      end
      
      def self.installed?
        return false unless Geoip.bin_installed?
        return false unless File.exists? data_file
        true
      end
      
      def lookup ip_or_domain
        %x{ #{Geoip::BIN} -f #{self.class.data_file} #{ip_or_domain} }
      end
    end
  end
end

%W[installer geolocatable city organization].each { |r| require "#{File.dirname(__FILE__)}/geoip/#{r}" } 
