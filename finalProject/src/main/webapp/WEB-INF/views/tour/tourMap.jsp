<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <style>
      #map {
        height: 400px;
        width: 100%;
       }
    </style>
  </head>
  <body>
    <div id="map"></div>
    <script>
    function initMap() {
    	  var uluru = {lat: ${mapy}, lng: ${mapx}};
    	  var map = new google.maps.Map(document.getElementById('map'), {
    	    zoom: 15,
    	    center: uluru
    	  });
    	  var marker = new google.maps.Marker({
    	    position: uluru,
    	    map: map
    	  });
    	}

    </script>
    <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDRvbbQ3ZU5pL6Q-JngNfSgfoO61PatCUw&callback=initMap">
    </script>
  </body>
</html>