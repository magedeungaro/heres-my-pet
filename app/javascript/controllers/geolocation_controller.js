import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "lat", "lng" ]

  connect() {
  }
  shareLocation() {
    navigator.geolocation.getCurrentPosition((position) => {
      let lat = position.coords.latitude
      let long = position.coords.longitude

      this.latTarget.value = lat
      this.lngTarget.value = long
    });
  }
}
