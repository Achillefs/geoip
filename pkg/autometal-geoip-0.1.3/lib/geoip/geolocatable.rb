module Autometal
  module Geolocatable
    def geoip
      @geoip = Autometal::Geoip.new(geo_attr) unless @geoip
      @geoip
    end
    def geo_attr
      begin
        send(:ip)
      rescue NoMethodError => e
        send(:domain)
      end
    end
    def country; geoip.country; end

    def county; geoip.county; end

    def city; geoip.city; end

    def lat; geoip.lat; end

    def lng; geoip.lng; end

    def latlng; geoip.latlng; end
    alias :latlon :latlng
  end
end