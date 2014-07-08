$(document).ready(function() {
    initialize();
});

function initialize() {

    //(долгота, широта)
    var coordinate = new google.maps.LatLng(55.753559, 37.609218);

    var mapOptions = {
        zoom: 12, //масштаб
        center: coordinate, //позиционируем карту на заданые координаты
        mapTypeId: google.maps.MapTypeId.ROADMAP //задаем тип карты
    };

    //инициализация карты
    map = new google.maps.Map(document.getElementById("maps"), mapOptions);

    // объявляем маркер
    var marker;
    google.maps.event.addListener(map, 'click', function(event) {
        placeMarker(event.latLng);
    });

    function placeMarker(location) {
        if (marker) {
            marker.setPosition(location);

        } else {
            marker = new google.maps.Marker({
                position: location,
                map: map
            });
        }
        console.log(marker.position);
        document.getElementById('latitude').value = location.lat();
        document.getElementById('longitude').value = location.lng();
    }

    $('#maps').click(function() {
        $('#buildings').submit();
    });
}