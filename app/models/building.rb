class Building < ActiveRecord::Base
  
  scope :close_to, ->(latitude, longitude, distance = 4000) {
    where(%{
            ST_DWithin(
              ST_GeographyFromText(
                'SRID=4326;POINT(' || longitude || ' ' || latitude || ')'
              ),
              ST_GeographyFromText('SRID=4332;POINT(%f %f)'), %d
            )
    } % [longitude,latitude,distance]).select(
      %{ address,
        ST_Distance(
          ST_GeographyFromText(
            'SRID=4326;POINT(' || longitude || ' ' || latitude || ')'
          ),
          ST_GeographyFromText('SRID=4332;POINT(%f %f)')
        )/1000
      as distance} % [longitude, latitude]).order('distance ASC')
  }

end
