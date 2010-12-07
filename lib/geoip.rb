$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Autometal
  class Geoip
    VERSION = '0.2.2'
    DATA_FILE_PATH = "/usr/local/share/GeoIP/"
    BIN = "geoiplookup"
    
    def self.bin_installed?
      %x{ #{self::BIN} --version } == "" ? false : true
    end
    
    class Package
      attr_accessor :version
      def initialize ip_or_domain
        return false unless self.class.installed?
        @response = self.lookup ip_or_domain
        process_response
      end
      
      def self.installed?
        return false unless Geoip.bin_installed?
        return false unless File.exists? data_file
        true
      end
      
      def lookup ip_or_domain
        puts "#{Geoip::BIN} -f #{self.class.data_file} #{ip_or_domain}"
        %x{ #{Geoip::BIN} -f #{self.class.data_file} #{ip_or_domain} }
      end
    end
  end
end

%W[installer geolocatable city organization].each { |r| require "#{File.dirname(__FILE__)}/geoip/#{r}" } 