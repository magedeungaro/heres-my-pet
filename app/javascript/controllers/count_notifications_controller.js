import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["counter"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: data => this.counterTarget.text(this.countNotifications(data)) }
      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`);

  }
  countNotifications(data){
    let unreadCount = 0
    if (data.unread) {
      unreadCount += 1
    }
    return unreadCount
  };
}
