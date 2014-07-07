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

  result["results"][0].fetch("formatted_address")
end

building_list = [
  {
    latitude: 55.762516904419364,
    longitude: 37.6189104415771
  },

  {
    latitude: 55.75899758022319,
    longitude: 37.610563407122754
  },

  {
    latitude: 55.75627486625449,
    longitude: 37.6113466121551
  },

  {
    latitude: 55.742724878107765,
    longitude: 37.612805733859204

  },

  {
    latitude: 55.71474049789284,
    longitude: 37.61083162802424
  },

  {
    latitude: 55.71648104419281,
    longitude: 37.67357386130061
  },

  {
    latitude: 55.69936230365378,
    longitude: 37.6454213954803
  },

  {
    latitude: 55.68760696217,
    longitude: 37.56765879172053
  },

  {
    latitude: 55.665029701273106,
    longitude: 37.73653067129817
  },

  {
    latitude: 55.66677246192896,
    longitude: 37.76030577200618
  },

  {
    latitude: 55.6786429537214,
    longitude: 37.75206602591243
  },

  {
    latitude: 55.699404626170995,
    longitude: 37.77401722449031
  },

  {
    latitude: 55.70956070515786,
    longitude: 37.76472605246272
  },

  {
    latitude: 55.71889229789232,
    longitude: 37.76815928000178
  },

  {
    latitude: 55.71889229789232,
    longitude: 37.76815928000178
  },

  {
    latitude: 55.78775859086664,
    longitude: 37.457752595126294
  },

  {
    latitude: 55.69136252492952,
    longitude: 37.512641320407056
  },

  {
    latitude: 55.670263800993226,
    longitude: 37.5520376064178
  },

  {
    latitude: 55.655909198485595,
    longitude: 37.5295070506927
  },

  {
    latitude: 55.65191414850876,
    longitude: 37.49938047903743
  },

  {
    latitude: 55.63544539789111,
    longitude: 37.587786088168286
  },

  {
    latitude: 55.63571185925543,
    longitude: 37.594781289279126
  },

  {
    latitude: 55.63794037425124,
    longitude: 37.631860146701
  },

  {
    latitude: 55.6447220312251,
    longitude: 37.65108622091975
  },

  {
    latitude: 55.6573134222517,
    longitude: 37.76004827994075
  },

  {
    latitude: 55.670118586859644,
    longitude: 37.77425325888362
  },

  {
    latitude: 55.68441959132724,
    longitude: 37.760348687350415
  },

  {
    latitude: 55.79275309467352,
    longitude: 37.78721369284358
  },

  {
    latitude: 55.80587569447059,
    longitude: 37.79017485159602
  },

  {
    latitude: 55.86217542853604,
    longitude: 37.50247038382258
  },

  {
    latitude: 55.87166315692055,
    longitude: 37.47530497091975
  },

  {
    latitude: 55.85225177161209,
    longitude: 37.49375856894221
  },

  {
    latitude: 55.84037377322642,
    longitude: 37.492471108615064
  },

  {
    latitude: 55.827769007718466,
    longitude: 37.50976599234309
  },

  {
    latitude: 55.81991005041435,
    longitude: 37.52980745810237
  },

  {
    latitude: 55.811350177575136,
    longitude: 37.52332724112239
  },

  {
    latitude: 55.79579291389292,
    longitude: 37.569589982211255
  },

  {
    latitude: 55.78775859086585,
    longitude: 37.59594000357356
  },

  {
    latitude: 55.78283584460597,
    longitude: 37.61374987143245
  },

  {
    latitude: 55.77525746074858,
    longitude: 37.630014786898755
  },

  {
    latitude: 55.76324729039297,
    longitude: 37.66604221838679
  },

  {
    latitude: 55.76078444660658,
    longitude: 37.67878807562556
  },

  {
    latitude: 55.74791235021327,
    longitude: 37.68910921591487
  },

  {
    latitude: 55.729188307617434,
    longitude: 37.666192422091626
  },

  {
    latitude: 55.7262157948291,
    longitude: 37.64258898276057
  },

  {
    latitude: 55.721381957533275,
    longitude: 37.61791265982356
  },

  {
    latitude: 55.717417764437165,
    longitude: 37.56602800863948
  },

  {
    latitude: 55.694301409388075,
    longitude: 37.56474054831233
  },

  {
    latitude: 55.692051912721325,
    longitude: 37.59297884482112
  },

  {
    latitude: 55.66156210289961,
    longitude: 37.69588984030452
  }
]

building_list.each do | coord |
  address = get_address(coord[:latitude], coord[:longitude])
  Building.create(address: address, latitude: coord[:latitude], longitude: coord[:longitude])

  sleep(1)
end
