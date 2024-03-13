import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl'

export default class extends Controller {
  static values = {
    apiKey: String,
    marker: Object
  }

  connect() {
    const options = {
      enableHighAccuracy: true,
      maximumAge: 10000,
      timeout: 5000
    }

    mapboxgl.accessToken = this.apiKeyValue;
    this.map = new mapboxgl.Map({
      container: this.element,
      center: [this.markerValue.lng, this.markerValue.lat],
      style: "mapbox://styles/emmapuget/cltmvmi0900nx01nr38jm10gq",
      zoom: 17
    })

    this.map.on('load', () => {
        navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
    })
  };

  success(pos) {
    const crd = pos.coords;
    this.getRoute(crd)
  };

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  };

  getRoute(crd) {
    const start = [crd.longitude, crd.latitude]
    const end = [this.markerValue.lng, this.markerValue.lat]

    fetch(`https://api.mapbox.com/directions/v5/mapbox/cycling/${start[0]},${start[1]};${end[0]},${end[1]}?steps=true&geometries=geojson&access_token=${mapboxgl.accessToken}`)
    .then(response => response.json())
    .then((data) => {
      const geojson = this.#getRouteCoordinates(data)
      this.#loadImage('https://res.cloudinary.com/dgmantli3/image/upload/v1710240782/v2ltcwrc2j9klcoqiqty.png', 'location')
      this.#loadImage('https://res.cloudinary.com/dgmantli3/image/upload/v1710241475/ku36ijrpcdjkarylqdoc.png', 'user_icon')
      this.#addRouteLayer(geojson)
      this.#addMarkerlayer(start, 'start', 'user_icon')
      this.#addMarkerlayer(end, 'end', 'location')
      this.#fitMapToMarkers(start, end)
    })
  }

  #loadImage(url, name) {
    this.map.loadImage(
      url,
      (error, image) => {
          if (error) throw error;

          this.map.addImage(name, image);
      }
    );
  }

  #getRouteCoordinates(data) {
    const itinary = data.routes[0].geometry.coordinates
    const geojson = {
      type: "Feature",
      properties: {},
      geometry: {
        type: "LineString",
        coordinates: itinary,
      },
    };
    return geojson
  }

  #addRouteLayer(geojson) {
    this.map.addLayer({
      id: "route",
      type: "line",
      source: {
        type: "geojson",
        data: geojson,
      },
      layout: {
        "line-join": "round",
        "line-cap": "round",
      },
      paint: {
        "line-color": "#3887be",
        "line-width": 5,
        "line-opacity": 0.75,
      },
    })
  }

  #addMarkerlayer(markerData, id, image) {
    this.map.addLayer({
      id: id,
      type: "symbol",
      source: {
        type: "geojson",
        data: {
          type: "FeatureCollection",
          features: [
            {
              type: "Feature",
              properties: {},
              geometry: {
                type: "Point",
                coordinates: markerData,
              },
            },
          ],
        },
      },
      layout: {
        'icon-image': image, // reference the image
        'icon-size': 0.08
      },
    });
  }


  #addMarkersToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
      new mapboxgl.Marker()
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup)
        .addTo(this.map)
  }
  #fitMapToMarkers(start, end) {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([start[0], start[1]])
    bounds.extend([end[0], end[1]])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 3000 })
  }
}
