import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["counter"]

  connect() {

    fetch('/notifications/notifications_counter', {
      headers : {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
       }
    })
      .then(response => response.json())
      .then((data) => {
        this.counterTarget.innerText = data
      })
  }
}
