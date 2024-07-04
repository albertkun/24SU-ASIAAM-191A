# Time Permitting: Creating a GeoJSON file

Our class projects will connect information from our surveys to our map will, so first we will practice by creating a GeoJSON file of our own!

## The power of people-based web mapping

Let's put to practice what web development and GIS can do for empowering our own stories.

Head over to [GeoJSON.io](http://www.geojson.io/):

- [http://www.geojson.io/](http://www.geojson.io/)

Click on the ==marker :material-map-marker:== tool:

![](./media/geojson1.png)

Click on a location of interest to you:

![](./media/geojson2.png)

Switch to the Table view by clicking on ==:material-table: Table==:

![](./media/geojson_table.png)

Add a data column by clicking on ==:heavy_plus_sign: new column== :

![](./media/geojson3.png)

Call it ==place== and click `OK`:

![](./media/geojson4.png)

Click inside the ==`place`== column

![](./media/geojson6.png)

Type in a description for the `place`, in this case I called it ==home==.

![](./media/geojson_home.png){: style="max-width:150px"}

Zoom out by pressing the ==:heavy_minus_sign:== button or ++ minus ++ key:

![](./media/geojson8.png)

Click the ==edit :material-square-edit-outline:== button:

![](./media/geojson9.png)

Click on the marker and move it the adjust the location:

![](./media/geojson9a.png)

Click the  edit :material-square-edit-outline: button and then ==Save== to save your edits:

![](./media/geojson10.png)


Add a new column called ==color==, to put some color to your map later.

![](./media/geojson7a.png)

When you are done, save your file by going to the top menu's ==Save== option:

![](./media/geojson11.png)

Click ==GeoJSON==:

![](./media/geojson12.png)

Download the file to your computer:

![](./media/geojson13.png){: style="max-width:300px"}

Copy the file into your project folder:

![](./media/geojson15.png)

### ⚽In-class Exercise #3 - Leaving your mark(er) on the map!

Go back and add more points to your GeoJSON file.

!!! tldr "Tasks"
    1. Add some points into your GeoJSON file
    2. Save the file and add it to your lab3 folder

After finishing the exercise, think about how empowering it was for you to be able to add data to the map yourselves. Whether you were clicking random spots or trying to find your old favorite places to visit, the ability to mark things is a reclaiming of mapping for yourself. This sense of staking a claim is what is meant when we refer to "empowering community voices".

## 🏁Final Checkpoint - Add your GeoJSON to your map

1. Make sure your GeoJSON file is in your `week2` folder!

2. Take note of the filename! (typically it is called `map.geojson`)

3. Modify your `js/init.js` file to add the GeoJSON file to your map:

!!! warning "Warning"
    Make sure to replace `NAME_OF_YOUR_GEOJSON.geojson` with the name of your GeoJSON file!

```js title="js/init.js"
fetch('NAME_OF_YOUR_GEOJSON.geojson').then(
    response => response.json()
).then(
    data => {
        map.addSource('places', {
            'type': 'geojson',
            'data': data
        });
        map.addLayer({
            'id': 'places',
            'type': 'circle',
            'source': 'places',
            'paint': {
                'circle-color': '#4264fb',
                'circle-radius': 6,
                'circle-stroke-width': 2,
                'circle-stroke-color': '#ffffff'
            }
        });
    }
);
```
