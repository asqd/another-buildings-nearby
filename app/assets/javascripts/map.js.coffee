# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready(initialize)


initialize = -> 
  coordinate = new google.maps.LatLng(55.753559, 37.609218)

  mapOptions = 
  	zoom: 12
  	center: coordinate
  	mapTypeId: google.maps.MapTypeId.ROADMAP

  map = new google.maps.Map(document.getElementById("maps"), mapOptions)

  marker = new google.maps.Marker()
  google.maps.event.addListener(map, 'click', (event) ->
  	placeMarker(event.latLng)
  	return)

  placeMarker = (location) ->
    if marker
      marker.setPosition(location)
    else
      marker = new google.maps.Marker(
      	position: location
      	map: map
)
    document.getElementById('latitude').value = location.lat()
    document.getElementById('longitude').value = location.lng()
    return
  
  $('#maps').click ->
  	$('#buildings').submit()
  	return
  return
    