
### Exploration:

If you'd rather use icons then a circular color, then try to see if you can implement this code, be sure to have a custom icon ready!

#### Customizing Icons
```javascript
function createCustomIcon (feature, latlng) {
	// Create a DOM element for the marker
	const el = document.createElement('div');
	el.style.backgroundImage = 'url(my-icon.png)';
	el.style.width = '25px'; // iconSize width
	el.style.height = '25px'; // iconSize height
	el.style.backgroundSize = '100%';
	el.style.display = 'block';
	el.style.borderRadius = '50%'; // Optional: makes the icon circular
	el.style.boxShadow = '0px 0px 20px rgba(0, 0, 0, 0.5)'; // Optional: adds shadow effect

  return new maplibregl.Marker(el)
    .setLngLat([latlng.lng, latlng.lat]); // Ensure the order is longitude, latitude
}
```

The following code will add a geojson called `ca_counties.geojson` with a field `TOTAL_POP` onto your map:

```javascript
// Step 1: Load GeoJSON Data
map.on('load', function() {
  // Step 2: Add a GeoJSON Source
  map.addSource('ca_counties', {
    type: 'geojson',
    data: 'js/lab1.geojson' // Path to your GeoJSON file
  });

  // Step 3: Add a Layer for the GeoJSON Data
  map.addLayer({
    id: 'counties',
    type: 'fill',
    source: 'ca_counties',
    layout: {},
    paint: {
      'fill-color': [
        'step',
        ['get', 'TOTAL_POP'],
        '#FFEDA0', 10000,
        '#FED976', 200000,
        '#FEB24C', 500000,
        '#BD0026', 1000000,
        '#800026'
      ],
      'fill-opacity': 0.7
    }
  });

  // Optional: Add a popup on click
  map.on('click', 'counties', function(e) {
    new mapboxgl.Popup()
      .setLngLat(e.lngLat)
      .setHTML(e.features[0].properties.name)
      .addTo(map);
  });

  // Change the cursor to a pointer when over the layer.
  map.on('mouseenter', 'counties', function() {
    map.getCanvas().style.cursor = 'pointer';
  });

  // Change it back to a default cursor when it leaves.
  map.on('mouseleave', 'counties', function() {
    map.getCanvas().style.cursor = '';
  });
});

```

