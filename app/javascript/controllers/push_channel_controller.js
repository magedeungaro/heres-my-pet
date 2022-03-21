import { Controller } from "@hotwired/stimulus"
import consumer from "../channels/consumer"

export default class extends Controller {
  static values = { userId: String }

  connect() {
    this.channel = consumer.subscriptions.create(
      { channel: "PushChannel", id: this.userIdValue },
      { received: (data) => {
        let push_data = JSON.parse(data.push_data)
        this.displayNotification('You have a new notification', data.path ,push_data)
       }}

      )
    console.log(`USER ID SUBSCRIPTION ${this.userIdValue}.`);
  }

  displayNotification(title, url, {content,notifiable_id}) {
    if (Notification.permission == 'granted') {
      navigator.serviceWorker.getRegistration().then(function(reg) {
        var options = {
          body: content,
          vibrate: [100, 50, 100],
          data: {
            dateOfArrival: Date.now(),
            primaryKey: notifiable_id,
            url: url
          }
        };
        reg.showNotification(title, options);
      });
    }
  }
}
