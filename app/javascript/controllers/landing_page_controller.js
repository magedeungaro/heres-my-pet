import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["standalone", "web"]

  connect() {
    if (window.matchMedia('(display-mode: standalone)').matches) {
      console.log("This is running as standalone.");
      this.standaloneTarget.classList.remove('d-none');
      this.webTarget.classList.add('d-none');
    }
  }
}
