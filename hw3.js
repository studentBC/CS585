// your JS code 
console.log("Hola, all!");
// my data is a label/ID for what we store, which is the object stored in variable d, 
// whose value is {"k1":[{"a":5, "b":-6}]}, which consists of a key called k1 
// with an array as its value: [{"a":5, "b":-6}]
var d = {"k1":[{"a":5, "b":-6}]};
localStorage.setItem("myData",JSON.stringify(d));
// you'd need to modify the above, to store all your points


//next [presumably after closing the browser, and reloading our html]
// we can fetch the stored data, just by supplying its key:
var dataStored = JSON.parse(localStorage.getItem("myData"));
// verify that we fetched our data correctly
console.log(dataStored); 
// we can iterate through our array [of points], like so:
var a = dataStored.k1; // 'a' will contain our array
for(var indx in a) { // indx is 0,1,2...
  console.log(a[indx]); // this could be a single point
}

//sample code
var canvas = document.getElementById('canvas');


// load and setup map layers
initMap();
var ox = 34.02058726718423, oy = -118.2854192814437;
// here's how to plot just ONE [lat,long] on the map! 
addMarker(ox,oy); 
    
//if (canvas.getContext) {
	//var ctx = canvas.getContext('2d');
	//ctx.beginPath();
	var R = 8, r = 1, a = 4;
	var x0 = R+r-a, y0 = 0;
	//ctx.moveTo(ox+10*x0, oy+10*y0);
	var cos = Math.cos, sin = Math.sin, pi = Math.PI, nRev = 16, end = pi*nRev;
	for (var t = 0.0; t < end; t+=0.01) {
		var tmp = (r/R)*t, temp = (1+r/R)*t;
		var x = (R+r)*cos(tmp) - a*cos(temp);
		var y = (R+r)*sin(tmp) - a*sin(temp);
    addMarker(ox+0.0001*x, oy+0.0001*y); 
    console.log()
		//ctx.lineTo(ox+10*x, oy+10*y);
	}
  //console.log("---------------");
	//ctx.stroke();
//}   
    
    

function initMap() {
        map = new OpenLayers.Map('map');
        basemap = new OpenLayers.Layer.OSM("Simple OSM Map");
        map.addLayer(basemap);
        markers = new OpenLayers.Layer.Markers("Markers");
        map.addLayer(markers);
        map.setCenter(
            new OpenLayers.LonLat(-118.2854192814437, 34.02058726718423).transform(
                new OpenLayers.Projection("EPSG:4326"),
                map.getProjectionObject()
            ), 12
        );
}// initMap()


function addMarker(latitude, longitude) {
        var lonLat = new OpenLayers.LonLat(longitude, latitude)
            .transform(
                new OpenLayers.Projection("EPSG:4326"), // transform from WGS 1984
                map.getProjectionObject() // to Spherical Mercator Projection
        );
        var point = new OpenLayers.Marker(lonLat);
        markers.addMarker(point);
        map.setCenter(lonLat, 8);
        //console.log(latitude + ", " + longitude);
}// addMarker()
