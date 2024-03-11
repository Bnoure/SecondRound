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

    navigator.geolocation.getCurrentPosition(this.success.bind(this), this.error, options);
  };

  success(pos) {
    console.log(pos.coords);
    const crd = pos.coords;
    this.getRoute(this.markerValue, crd.latitude, crd.longitude, this.apiKeyValue, this.map)
    /*     this.#addMarkersToMap()
        this.#fitMapToMarkers() */
  };

  error(err) {
    console.warn(`ERROR(${err.code}): ${err.message}`);
  };

  async getRoute(end, start_lat, start_lng, apiKeyValue, map) {
    const query = await fetch(
      `https://api.mapbox.com/directions/v5/mapbox/walking/${start_lat},${start_lng};${end.lat},${end.lng}?steps=true&geometries=geojson&access_token=${apiKeyValue}`,
      { method: 'GET' }
    );

    const json = await query.json();
    const data = json.routes[0];
    console.log(data)
    const route = data.geometry.coordinates
    const geojson = {
      type: 'Feature',
      properties: {},
      geometry: {
        type: 'LineString',
        coordinates: route
      }
    };

    debugger

      // if the route already exists on the map, we'll reset it using setData
    if (map.getSource('route')) {
      map.getSource('route').setData(geojson);
    }
    // otherwise, we'll make a new request
    else {
      map.addLayer({
        id: 'route',
        type: 'line',
        source: {
          type: 'geojson',
          data: geojson
        },
        layout: {
          'line-join': 'round',
          'line-cap': 'round'
        },
        paint: {
          'line-color': '#3887be',
          'line-width': 5,
          'line-opacity': 0.75
        }
      });
    }
    map.addLayer({
      id: 'point',
      type: 'circle',
      source: {
        type: 'geojson',
        data: {
          type: 'FeatureCollection',
          features: [
            {
              type: 'Feature',
              properties: {},
              geometry: {
                type: 'Point',
                coordinates: [start_lng, start_lat]
              }
            }
          ]
        }
      },
      paint: {
        'circle-radius': 10,
        'circle-color': '#3887be'
      }
    });
  }

  #addMarkersToMap() {
      const popup = new mapboxgl.Popup().setHTML(this.markerValue.info_window)
      new mapboxgl.Marker()
        .setLngLat([ this.markerValue.lng, this.markerValue.lat ])
        .setPopup(popup)
        .addTo(this.map)
  }
  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    bounds.extend([ this.markerValue.lng, this.markerValue.lat ])
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 17, duration: 5000 })
  }
}
