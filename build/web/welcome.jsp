<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/bootstrap.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet'
type='text/css'>
<link href='css/corgi.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/elusive-webfont.css">
<script src="js/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="js/corgi.js" type="text/javascript"></script>
<script src="js/html5shiv.js"></script>
<script src="http://maps.google.com/maps/api/js?sensor=false" type="text/javascript"></script>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />




<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        
        
        
        
    </head>
    <body>
        
      
        
      <div class="navbar navbar-fixed" style=" margin-bottom: 0px;" />
      <div class="navbar-inner">
        <div class="container">
          <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="brand" href="welcome.jsp">MyGuidePal</a>
          <div class="nav-collapse collapse">
              
 
    
        
        <ul class='nav'>
            
        </ul>
        <form class="navbar-search pull-right" action="Out.do" method="post" >
            
      <%
          if ((session.getAttribute("username") == null) || (session.getAttribute("username") == "")) {
                        response.sendRedirect("index.jsp");
                  }
          else {
            out.print("welcome " + session.getAttribute("username"));
                                }
      %>
            
            <input type="submit" value="sign out" class="btn" style="margin-top: 0px; margin-bottom: 5px;"/>
        </form>
        
        
  

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
        


<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&signed_in=true"></script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?libraries=geometry&sensor=false&language=en"></script>

<script type="text/javascript">

    //$.get('Marker.do', function(location){ 
    var markers = [], i, posi = [], apostasi, min, kontino, sinte = [];
    function initialize() {
    var centervolos = new google.maps.LatLng(39.2050, 22.5640);

    var mapopt =  {
      zoom: 7,
      center: centervolos,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };
    map = new google.maps.Map(document.getElementById('googleMap'),mapopt);


    }



    
     function closest23(){   
         
         //google.maps.event.addDomListener(window, 'load', initialize);
              alert("show us your current location with right click");
              
              setAllMap(null);
              
               google.maps.event.addListener(map, 'rightclick', function(event) {
                    closeMarker(event.latLng);
               });
     }           
     
     function closeMarker(position){
        var marker = new google.maps.Marker({
            position: position,
            map: map,
            draggable: true
        });
    
        $(document).ready(function() {    
                $.getJSON("Show.do", function(json1) {
                       $.each(json1, function(key, result) {
                             var latLng = new google.maps.LatLng(result.lat, result.lng); 
                       
                             var apostasi = google.maps.geometry.spherical.computeDistanceBetween(position,latLng);
                             
                             posi.push(apostasi);
                             sinte.push(latLng);
                        });
                        
                        var min = posi[0];
                       
                        
                        for ( i = 1; i < posi.length; i++) {
                               if (posi[i]<min){
                                   min = posi[i];
                                   var kontino = i;
                                   var sintetagmenes = sinte[i];
                               }
                        }
                        //alert(" i apostasi einai:  " + min + "kai einai ston marker " + kontino);
                        
                        var marker = new google.maps.Marker({
                                 position: sintetagmenes,
                                 map: map,
                                 draggable: false
                             }); 
                });
         });
    
    }
     
     function clear23() {
        
        setAllMap(null);
     }
     
     
     function setAllMap(map) {
        for (var i = 0; i < markers.length; i++) {
          markers[i].setMap(map);
          }
     }

     
     function showall(){
         
          $(document).ready(function() {    
                $.getJSON("Show.do", function(json1) {
                       $.each(json1, function(key, result) {
                             var latLng = new google.maps.LatLng(result.lat, result.lng); 
                       // Creating a marker and putting it on the map
                             var marker = new google.maps.Marker({
                                 position: latLng,
                                 map: map
                                 
                             });
                             markers.push(marker);
 
                        });
                });
         });
         
         
     }
         
    
     function addspot(){
          alert("show the new spot with right click");
         google.maps.event.addDomListener(window, 'load', initialize);
     google.maps.event.addListener(map, 'rightclick', function(event) {
            addMarker(event.latLng);
         });
     }
     
     
     function addMarker(location) {         
                
        var marker = new google.maps.Marker({
         position: location,
         map: map,
         draggable: false
    });
     
     
     //Content structure of info Window for the Markers
    var contentString = $('<div class="marker-info-win">'+
    '<div class="marker-inner-win"><span class="info-content">'+
    '<h1 class="marker-heading">'+'new spot' +
    '<label for="pName"><span>Place Name :</span><input type="text" name="pName" class="save-name" placeholder="Enter Title" maxlength="40" /></label>' +
    '</h1>'+'</div></p><button name="save-marker" class="save-marker">Save Marker Details</button>'+
    '</span><button name="remove-marker" class="remove-marker" title="Remove Marker">Remove Marker</button>'+
    '</div></div>');
    

     
     //Create an infoWindow
    var infowindow = new google.maps.InfoWindow();{
        //content: contentString[0];
    }
    //set the content of infoWindow
    infowindow.setContent(contentString[0]);
    
    infowindow.open(map,marker);
    
    google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map,marker); // click on marker opens info window
    });
    
     
     //Find remove button in infoWindow
    var removeBtn   = contentString.find('button.remove-marker')[0];

   //Find save button in infoWindow
    var saveBtn     = contentString.find('button.save-marker')[0];
     
     //add click listner to remove marker button
    google.maps.event.addDomListener(removeBtn, "click", function(event) {
        //call remove_marker function to remove the marker from the map
        remove_marker(marker);
    });
   
    if(typeof saveBtn !== 'undefined') //continue only when save button is present
    {
        //add click listner to save marker button
        google.maps.event.addDomListener(saveBtn, "click", function(event) {
            //var mReplace = contentString.find('span.info-content'); //html to be replaced after success
            var mName = contentString.find('input.save-name')[0].value; //name input field value
            
            if(mName ==='')
            {
                alert("Please enter valid Name!");
            }else{
                //call save_marker function and save the marker details
                //alert(mName);
                var latitude = location.lat();
                var longitude = location.lng();
                
                alert(" to latitude einai:  " + latitude);
                save_marker(mName, latitude, longitude);
            }
        });
    }
     markers.push(marker);
    }
    
    
    function save_marker(name,lat,lng){
    
    var myData = {Name : name, Latitude : lat, Longitude : lng }; //post variables
       
    $.ajax({
      type: "POST",
      url: "Add.do",
      data: myData,
      success:function(data){
            marker.setDraggable(false); //set marker to fixed
        },
        error:function (xhr, ajaxOptions, thrownError){
            alert("lathos"); //throw any errors
        }
    });
    }

    google.maps.event.addDomListener(window, 'load', initialize);
</script>

<div id="googleMap" style="width:auto;height:500px;"></div>

        <section class="page-section ">
            <div class="container">
                <div class="row">
                    
                    <input onclick="addspot()" type=button value="Add a spot">
                    <input onclick="closest23()" type=button value="Find your closest beach">
                    <input onclick="showall()" type=button value="Show all beaches">
                    <input onclick="clear23()" type=button value="clear beaches">

                </div>
            </div>
        </section>

</body>

</html>


