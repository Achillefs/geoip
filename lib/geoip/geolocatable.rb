module Autometal
  module Geolocatable
    def geoip_city
      @geoip_city = false unless @geoip_city
      if Autometal::Geoip::City.installed?
        @geoip_city = Autometal::Geoip::City.new(geo_attr) unless @geoip_city
      end
      @geoip_city
    end
    def geoip_org
      @geoip_org = false unless @geoip_org
      if Autometal::Geoip::Organization.installed?
        @geoip_org = Autometal::Geoip::Organization.new(geo_attr) unless @geoip_org
      end
      @geoip_org
    end

    def geo_attr
      begin
        send(:ip)
      rescue NoMethodError
        send(:domain)
      end
    end
    def country; geoip_city.country if geoip_city; end
    
    def county; geoip_city.county if geoip_city; end

    def city; geoip_city.city if geoip_city; end

    def lat; geoip_city.lat if geoip_city; end

    def lng; geoip_city.lng if geoip_city; end
    
    def organization; geoip_org.organization if geoip_org; end
    
    def latlng; geoip_city.latlng if geoip_city; end
    alias :latlon :latlng
  end
end