module Autometal
  class Geoip
=begin rdoc
  GeoLiteCity database extension
  provides Country, City, Latitude and Longitude information.
=end
    class City < Geoip::Package
      attr_accessor :country, :county, :city, :lat, :lng
      def latlng
        [self.lat,self.lng]
      end
      alias :latlon :latlng
      
      def self.data_file
        File.join(Geoip::DATA_FILE_PATH,"GeoLiteCity.dat")
      end
      
      def process_response
        ar = @response.split(", ")
        @version = ar[0]
        @country = ar[1].gsub("Rev 1: ","")
        @county = ar[2]
        @city = ar[3]
        @lat = ar[5].to_f
        @lng = ar[6].to_f
      end
    end
  end
end