---
hide:
  - tags
tags:
  - Lab 2
---
# JavaScript Writing some FUNctions

Creating our first map with [MapLibre GL](https://maplibre.org/maplibre-gl-js/docs/) learning to use JavaScript!

![](./media/intro.png){: style="max-width:300px"}

!!! tldr "Goals"
    - Understand how JavaScript works with HTML and CSS
    - Understand how JavaScript variables, functions, methods work together

## Lab outline

1. [JavaScript Functions](./1.md)
2. [Adding Event Listeners](./2.md)

## Starting Template Code for lab #2

Use the following template code or your lab assignment #1:

```html title="index.html" linenums="1"
<!DOCTYPE html>
<html>
    <head>
        <title>Hello World with MapLibreGl</title>
        <!-- hint: remember to change your page title! -->
        <meta charset="utf-8" />
        <link rel="shortcut icon" href="#">
        <link rel="stylesheet" href="styles/style.css">

        <!-- MapLibreGL's css-->
        <link rel="stylesheet" href="https://unpkg.com/maplibre-gl/dist/maplibre-gl.css" />

		<!-- MapLibreGL's JavaScript-->
		<script src="https://unpkg.com/maplibre-gl/dist/maplibre-gl.js"></script>
    </head>
    
    <body>
        <header>
			Hello World
            <!-- hint: you can make a menu with other links here if you'd like -->
        </header>
        
        <main>
			<div class="portfolio">
				<!-- Portfolio content goes here -->
				 <img src="me.png">
				 <h2>Where I work</h2>
				 <ul>
					 <li>Los Angeles Metro</li>
					 <li>UCLA</li>
					 <li>Yindee Games</li>
				 </ul>
			</div>
            <div id="map"></div>
        </main>
        <div id="footer">
            Copyright(2024)
        </div>
        <script src="js/init.js"></script>
    </body>
</html>
```

```javascript title="js/init.js"
// Initialize the map
const map = new maplibregl.Map({
    container: 'map', // container ID
    style: 'https://api.maptiler.com/maps/streets/style.json?key=wsyYBQjqRwKnNsZrtci1', // Your style URL
    center: [ -118.444, 34.0709], // Starting position [lng, lat]
    zoom: 15 // Starting zoom level
});

// Add a marker to the map
new maplibregl.Marker()
    .setLngLat([ -118.444, 34.0709])
    .setPopup(new maplibregl.Popup({ offset: 25 }) // Add popups
        .setHTML('Math Sciences 4328 aka the Technology Sandbox<br> is the lab where I used to work in '))
    .addTo(map);
```

```css title="styles/style.css" linenums="1"

* {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

html {
	background-color: aqua;
}

html, body {
	height: 80vh;
	padding: 1rem;
	box-sizing: border-box;
}

body {
	display: grid;
	grid-template-areas: 
		"header"
		"main"
		"footer";
	grid-template-rows: auto 1fr auto;
}

main {
	display: grid;
	grid-template-areas:
		"portfolio map";
	grid-template-columns: 1fr 1fr;
}

header { 
	grid-area: header;
}

main { 
	grid-area: main;
}

.portfolio {
	grid-area: portfolio;
	display: flex; /* This will make the items inside the portfolio flex items */
	flex-direction: column; /* This can be row if you want the items to be side by side */
	justify-content: center; /* This can be flex-start, flex-end, space-between, space-around, space-evenly */
	align-items: center; /* This can be flex-start, flex-end, stretch, baseline */
}

#map { 
	grid-area: map;
	height: 80vh;
}

#footer {
	grid-area: footer;
	padding: 1rem;
	background-color: #4677a0; /* Sets a darker background for contrast */
	color: #fff; /* Ensures text is readable against the dark background */
	text-align: center; /* Centers the footer content */
}

```