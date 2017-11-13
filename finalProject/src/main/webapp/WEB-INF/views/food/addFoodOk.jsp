<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=UTF-8">
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
         width: 70%;
        height: 70%;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
      #floating-panel {
        position: absolute;
        top: 10px;
        left: 25%;
        z-index: 5;
        background-color: #fff;
        padding: 5px;
        border: 1px solid #999;
        text-align: center;
        font-family: 'Roboto','sans-serif';
        line-height: 30px;
        padding-left: 10px;
      }
    </style>
   <script>
      function next(){
    	  location.href="addImage.do";
      }
      
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 16,
          center: {lat: 37.566535, lng: 126.97796919999996}
        });
        var geocoder = new google.maps.Geocoder();
	
        geocodeAddress(geocoder, map);
        
      }

      function geocodeAddress(geocoder, resultsMap) {
    	var postcode = document.getElementById('postcode').value;
        var address1 = document.getElementById('addr1').value;
        var address2 = document.getElementById('addr2').value;
        geocoder.geocode({'address': postcode + address1 + address2}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              zoom: 15,
              position: results[0].geometry.location
            });
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      }
    </script>
     <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCbusV4tEDJhoqgUPVImHs8undZrTOaDEU&callback=initMap">
    </script>
<title>Insert title here</title>
</head>
<body>

	<table>
	<c:set var="arr" value="${fdto}"/>
		<tr>
			<th>가게이름</th>
			<td>${arr.fname}</td>
		</tr>
		<tr>
			<td><input type="text" name="postcode" id="postcode" value="${arr.postcode}"></td>
			<td><input type="text" name="addr1" id="addr1" value="${arr.addr1}"></td>
			<td><input type="text" name="addr2" id="addr2" value="${arr.addr2}"></td>
		</tr>
	</table>

<div id="map"></div>
<input type="button" value="다음" onclick="next()">
</body>
</html>