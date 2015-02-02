<%@page contentType="text/html" pageEncoding="UTF-8"%>
<link href="css/bootstrap.css" rel="stylesheet">
<link href='https://fonts.googleapis.com/css?family=Raleway:400,600' rel='stylesheet'
type='text/css'>
<link href='css/corgi.css' rel='stylesheet' type='text/css'>
<link rel="stylesheet" href="css/elusive-webfont.css">
<script src="js/jquery.min.js" type="text/javascript"></script>
<script src="js/corgi.js" type="text/javascript"></script>
<script src="js/html5shiv.js"></script>
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
          <a class="brand" href="#">MyGuidePal</a>
          <div class="nav-collapse collapse">
              
 
    
        <a class='brand'>Test</a>
        <ul class='nav'>
            
        </ul>
        <form class="navbar-search pull-right" action="Login.do" method="post">
            <input type="text" name="user" class="span2" placeholder="Login">
            <input type="password" name="pass" class="span2" placeholder="Password">
            <input type="submit" value="Login" class="btn" style="margin-top: 0px; margin-bottom: 5px;"/>
        </form>
        
        
        
        
            
            
              
  

          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>
        
<script
src="http://maps.googleapis.com/maps/api/js">
</script>

<script>
function initialize() {
  var mapProp = {
    center:new google.maps.LatLng(39.2050,22.5640),
    zoom:7,
    mapTypeId:google.maps.MapTypeId.ROADMAP
  };
  var map=new google.maps.Map(document.getElementById("googleMap"), mapProp);
}
google.maps.event.addDomListener(window, 'load', initialize);
</script>



<div id="googleMap" style="width:auto;height:500px;"></div>



        <section class="page-section ">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12 text-center animated fadeInLeft visible" data-animation="fadeInLeft" data-animation-delay="100">
                        <h2 class="media-heading"><a href="register.jsp">Register</a> in MyGuidePal and enjoy your journey... </h2>
                    </div>
                </div>
            </div>
        </section>




</body>


</html>


