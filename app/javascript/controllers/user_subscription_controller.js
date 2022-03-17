import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["notifications"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      // {received: (data) => {debugger} }
      { received: data => this.notificationsTarget.insertAdjacentHTML("beforeend", data) }
      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`)
  }
}
