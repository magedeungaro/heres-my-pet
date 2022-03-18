import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["notifications"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: data => this.notificationsTarget.insertAdjacentHTML("afterbegin", data) },

      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`);

  }
  //   data.forEach(function(notification, i) {
  //     console.log('[forEach]', notification, i);
  //     //   if (notification.unread) {
  //     //     unreadCount += 1
  //     //   }
  //     // });
  //     // console.log(unreadCount)
  //     // unreadCount
  // })
  //   // $.each(data, (i, notification) => {
  // }

}
