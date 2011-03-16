<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:rs="http://www.w3.org/2005/sparql-results#" version="1.0">
  <xsl:template match="rs:sparql">
<html> 
<head> 
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<meta http-equiv="content-type" content="text/html; charset=UTF-8"/> 
<title>Battlefields</title> 
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" /> 
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 

<script type="text/javascript"> 
  function markPoints(map) {
          <xsl:for-each select="rs:results/rs:result">
<xsl:variable name="lat" select="rs:binding[@name = 'lat']" />
<xsl:variable name="long" select="rs:binding[@name = 'long']" />
<xsl:variable name="label" select="rs:binding[@name = 'label']" />
<xsl:text>markPoint(</xsl:text><xsl:value-of select="$lat" />, <xsl:value-of select="$long" />, map, "<xsl:value-of select="$label" />");
          </xsl:for-each>
  }
</script> 


<script type="text/javascript"> 
  function initialize() {
    var myOptions = {
      zoom: 5,
      center: new google.maps.LatLng(52,0),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map(document.getElementById("map_canvas"), myOptions);
    markPoints(map); 
  }
  function markPoint(lat, long, map, lbl) {
     var marker = new google.maps.Marker({
        position: new google.maps.LatLng(lat,long), 
        map: map,
        title:lbl
    }); 
  }
</script> 
</head> 
<body onload="initialize()"> 
  <div id="map_canvas"></div> 
</body> 
</html>
  </xsl:template>

</xsl:stylesheet>
