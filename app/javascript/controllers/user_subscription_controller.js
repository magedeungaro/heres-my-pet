import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }
  static targets = ["notifications"]

  connect() {

    this.channel = consumer.subscriptions.create(
      { channel: "UserChannel", id: this.userIdValue },
      { received: (data) => {
        this.notificationsTarget.insertAdjacentHTML("afterbegin", data.html)

        let push_data = JSON.parse(data.push_data)
        this.displayNotification('You have a new notification', push_data)
        console.log(data)
       }}

      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`);

  }

  displayNotification(title, {content, id}) {
    if (Notification.permission == 'granted') {
      navigator.serviceWorker.getRegistration().then(function(reg) {
        var options = {
          body: content,
          vibrate: [100, 50, 100],
          data: {
            dateOfArrival: Date.now(),
            primaryKey: id
          }
        };
        reg.showNotification(title, options);
      });
    }
  }
}
