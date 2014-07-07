class Building < ActiveRecord::Base
  #reverse_geocoded_by :latitude, :longitude
  #after_validation :reverse_geocode

  scope :close_to, ->(latitude, longitude, distance = 4000) {
    where(%{
            ST_DWithin(
              ST_GeographyFromText(
                'SRID=4326;POINT(' || longitude || ' ' || latitude || ')'
              ),
              ST_GeographyFromText('SRID=4332;POINT(%f %f)'), %d
            )
    } % [longitude,latitude,distance])
  }
  
end
