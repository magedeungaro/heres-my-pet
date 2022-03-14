import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "lat", "lng" ]

  connect() {
    console.log(this.latTarget)
  }
  shareLocation() {
    console.log("Test 2")
    navigator.geolocation.getCurrentPosition((position) =>{
      let lat = position.coords.latitude;
      let long = position.coords.longitude;
      console.log(this);
      this.latTarget.value = lat
      this.lngTarget.value = long
    });
  }
}
