# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def get_address(latitude, longitude)
  
  uri = URI.parse("http://maps.googleapis.com/maps/api/geocode/json?latlng=#{latitude},#{longitude}&sensor=true_or_false&language=ru")

  http = Net::HTTP.new(uri.host, uri.port)
  request = Net::HTTP::Get.new(uri.request_uri)

  response = http.request(request)

  result = JSON.parse(response.body) if response.code == "200"

  result["results"][0].fetch("formatted_address") if result["results"][0].value?(["street_address"])

end

def get_random_building(area)
  lat = rand(area[0]..area[2])
  lon = rand(area[1]..area[3])
  latlon = [lat, lon]
end

#Координаты прямоугольной области Москвы в радиусе 15км от центра
area = [55.62092775911219, 37.37757503698717, 55.890724240887806, 37.85702496301283]

i = 0
while i < 50 
  coord = get_random_building(area)
  addr = get_address(coord[0], coord[1])
  if !addr.nil?
    Building.create(address: addr, latitude: coord[0], longitude: coord[1] )
    i += 1
  end
  
  sleep(1)
end
