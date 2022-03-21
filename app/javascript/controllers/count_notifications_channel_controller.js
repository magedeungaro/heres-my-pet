import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["counter"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "NotificationChannel", id: this.userIdValue },
      { received: data => this.counterTarget.innerHTML = data }
      )
    console.log( this.counterTarget);

  }
}
