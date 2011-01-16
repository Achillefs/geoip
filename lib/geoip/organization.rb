module Autometal
  class Geoip
=begin rdoc
  GeoIPOrg database extension
  provides Country and Organization (ISP) information
=end
    class Organization < Package
      attr_accessor :organization
      
      def self.data_file
        File.join(Geoip::DATA_FILE_PATH,"GeoIPOrg.dat")
      end
      
      def process_response
        ar = @response.split(": ")
        @version = ar[0].strip
        @organization = ar[1].strip
      end
    end
  end
end