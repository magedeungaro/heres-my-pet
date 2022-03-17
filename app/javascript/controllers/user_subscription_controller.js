import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["notifications"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      // {received: (data) => {debugger} }
      { received: data => this.notificationsTarget.insertAdjacentHTML("afterbegin", data) }
      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`)
    console.log(this.notificationTarget.count)
  }
  count_notifications(data){
    let unreadCount = 0
    $.each(data, (i, notification) => {
      if (notification.unread) {
        unreadCount += 1
      }
    });
    this.unreadCountTarget.innerHTML = unreadCount
  }

}
